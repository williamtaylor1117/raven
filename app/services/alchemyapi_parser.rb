class AlchemyapiParser

  attr_reader :type, :q
  attr_accessor :response
	
	def initialize(params)

    @params = params
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
    document = Document.new author: @response["author"],
                            image: @response["image_url"],
                            title: @response["title"],
                            url: @response["url"]
    document.save!

    @response["docSentiment"]["type"]
    @response["docSentiment"]["score"]
    @response["docSentiment"]["mixed"]

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
      relation_record = document.relations.build sentence: relation["sentence"],
                                                 subject_text: relation["subject"]["text"]

        relation["subject"]["keywords"].each do |keyword|
          keyword_record = relation_record.keywords.build text: keyword["text"]
          keyword_record.knowledge_graph_type_hierarchy = keyword["knowledgeGraph"]["typeHierarchy"] if keyword["knowledgeGraph"]
          keyword_record.save!
        end #end of keyword loop

      relation_record.save!
    end #end of relation loop

  end #end of response for a single document return

	def successful?
		true #make it true if everything saved successfully
	end
end
