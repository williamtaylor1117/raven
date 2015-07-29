class AlchemyapiParser

  attr_reader :type, :q
  attr_accessor :response
	
	def initialize(params, current_user)

    @params = params
    @successful = false
    @user = current_user
	end

	def call

		make_request_to_alchemy
		save_document
  end

  def make_request_to_alchemy

    alchemyapi = AlchemyAPI.new()
    @response = alchemyapi.combined(@params[:type], @params[:q],  {'extract'=>'page-image, title, author, concept, doc-sentiment, keyword, entity, relation ','sentiment'=>1, 'knowledgeGraph'=>1  })
  end

  def save_document

    #initialize document and bring in top level attributes
    document = @user.documents.new author: @response["author"],
                                   image: @response["image_url"],
                                   title: @response["title"],
                                   url: @response["url"],
                                   result: @response,
                                   transaction_count: @response["totalTransactions"]
    document.save!

    if @response["docSentiment"]

      document_sentiment = document.build_sentiment sentiment_type: @response["docSentiment"]["type"],
                                                    sentiment_score: @response["docSentiment"]["score"]
      document_sentiment.sentiment_mixed = @response["docSentiment"]["mixed"] if @response["docSentiment"]["mixed"]
      document_sentiment.save!
    end

    @response["concepts"].each do |concept|
      concept_record = document.concepts.build text: concept["text"],
                                        relevance: concept["relevance"]
      concept_record.knowledge_graph_type_hierarchy = concept["knowledgeGraph"]["typeHierarchy"] if concept["knowledgeGraph"]
      concept_record.save!
    end #end of top level concept loop

    @response["keywords"].each do |keyword|
      keyword_record = document.keywords.build text: keyword["text"],
                                        relevance: keyword["relevance"]
      keyword_record.knowledge_graph_type_hierarchy = keyword["knowledgeGraph"]["typeHierarchy"] if keyword["knowledgeGraph"]
      keyword_record.save!
    end #end of top level keyword loop

    @response["entities"].each do |entity|
      entity_record = document.entities.build entity_type: entity["type"],
                                       relevance: entity["relevance"],
                                       text: entity["text"],
                                       count: entity["count"]
      entity_record.knowledge_graph_type_hierarchy =  entity["knowledgeGraph"]["typeHierarchy"] if entity["knowledgeGraph"]
      entity_record.save!
    end #end of top level entity loop

    @response["relations"].each do |relation|
      relation_record = document.relations.create! sentence: relation["sentence"],
                                                 subject_text: relation["subject"]["text"]

        if relation["subject"]["entities"]
          relation["subject"]["entities"].each do |entity|
            entity_record = relation_record.entities.build entity_type: entity["type"],
                                                            relevance: entity["relevance"],
                                                            text: entity["text"],
                                                            count: entity["count"]
            entity_record.knowledge_graph_type_hierarchy =  entity["knowledgeGraph"]["typeHierarchy"] if entity["knowledgeGraph"]
            entity_record.save!
          end #end of top level entity loop
        end

        if relation["subject"]["keywords"]
          relation["subject"]["keywords"].each do |keyword|
            keyword_record = relation_record.keywords.build text: keyword["text"]
            keyword_record.knowledge_graph_type_hierarchy = keyword["knowledgeGraph"]["typeHierarchy"] if keyword["knowledgeGraph"]
            keyword_record.save!
          end #end of keyword loop
        end

        relation_record.actions.build text: relation["action"]["text"],
                                      lemmatized: relation["action"]["lemmatized"],
                                      verb_text: relation["action"]["verb"]["text"],
                                      verb_tense: relation["action"]["verb"]["tense"]

        relation_object_record = relation_record.relation_objects.create! text: relation["object"]["text"] if relation["object"].present?
          if relation["object"]["sentiment"]
            relation_sentiment = relation_object_record.build_sentiment sentiment_type: relation["object"]["sentiment"]["type"],
                                                                sentiment_score: relation["object"]["sentiment"]["score"]
            relation_sentiment.save!
          end

          if relation["object"]["keywords"]
            relation["object"]["keywords"].each do |keyword|
              keyword_record = relation_object_record.keywords.build text: keyword["text"]
              keyword_record.knowledge_graph_type_hierarchy = keyword["knowledgeGraph"]["typeHierarchy"] if keyword["knowledgeGraph"]
              keyword_record.save!
            end
          end
      relation_record.save!

    end #end of relation loop
    @successful = true if document.persisted?

  end #end of response for a single document return

	def successful?
		@successful #make it true if everything saved successfully
	end
end
