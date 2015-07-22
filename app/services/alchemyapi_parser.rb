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
    #response = alchemyapi.combined(@params[:type], @params[:q],  {'extract'=>'title, author' })
    @response = alchemyapi.combined(@params[:type], @params[:q],  {'extract'=>'page-image, title, author, concept, doc-sentiment, keyword, entity, relation ','sentiment'=>1, 'knowledgeGraph'=>1  })

  end

  def save_document

    # response_object = JSON.parse(@response)

    document = Document.new author: @response["author"],
                            image: @response["image_url"],
                            title: @response["title"],
                            url: @response["url"]
    document.save!

    @response["docSentiment"]["type"]
    @response["docSentiment"]["score"]
    @response["docSentiment"]["mixed"]

    @response["concepts"].each do |concept|
      concept = document.concepts.build text: concept["text"],
                                        relevance: concept["relevance"]
      concept.knowledge_graph_type_hierarchy = concept["knowledgeGraph"]["typeHierarchy"] if concept["knowledgeGraph"]
      concept.save!
    end

    @response["keywords"].each do |keyword|
      keyword = document.keywords.build text: keyword["text"],
                                        relevance: keyword["relevance"]
      keyword.knowledge_graph_type_hierarchy = keyword["knowledgeGraph"]["typeHierarchy"] if keyword["knowledgeGraph"]
      keyword.save!
    end

    @response["entities"].each do |entity|
      entity = document.entities.build entity_type: entity["type"],
                                       relevance: entity["relevance"],
                                       text: entity["text"],
                                       count: entity["count"]
      entity.knowledge_graph_type_hierarchy =  entity["knowledgeGraph"]["typeHierarchy"] if entity["knowledgeGraph"]
      entity.save!
    end

    @response["relations"].each do |relation|
      relation_record = document.relations.create! attribute: relation["attribute"]

        relation['keywords'].each do |keyword|
          relation_record.keywords.create! attribute: keyword["attribute"],
            knowledge_graph_type_hierarchy: keyword["knowledgeGraph"]


      end
    end

		document.entities.build name: @response["entities"]["name"]

	end

	def successful?
		true # make it true if everything saved successfully
	end
end
