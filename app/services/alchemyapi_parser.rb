class AlchemyapiParser
	attr_reader :params
  attr_accessor :response
	
	def intialize(params: nil)
		@params = params
	end

	def call

		make_request_to_alchemy
		save_document

		# @response[entities]

	end

	def make_request_to_alchemy

		alchemyapi = AlchemyAPI.new()
		@response = alchemyapi.combined(params[:type], params[:q],  {'extract'=>'title, author' })
		#response = alchemyapi.combined(params[:type], params[:q],  {'extract'=>'page-image, title, author, concept, doc-sentiment, keyword, entity, relation ','sentiment'=>1, 'knowledgeGraph'=>1  })

	end

	def save_document
		response_object = JSON.parse @response

		document = Document.new author: @response["document"]["author"],
                            image_url: @response["document"]["image_url"],
                            title: @response["document"]["title"],
                            url: @response["document"]["url"]
    document.save!

    response_object["document"]["docSentiment"]["type"]["score"]["mixed"]

    response_object["document"]["concepts"].each do |concept|
      document.concepts.create! text: concept["text"],
                                relevance: concept["relevance"],
                                knowledge_graph_type_hierarchy: concept["knowledgeGraph"]["typeHierarchy"]
    end

    response_object["document"]["keywords"].each do |keyword|
      document.keywords.create! text: keyword["text"],
                                relevance: keyword["relevance"],
                                knowledge_graph_type_hierarchy: keyword["knowledgeGraph"]["typeHierarchy"]
    end

    response_object["document"]["entities"].each do |entity|
      document.entities.create! type: entity["type"],
                                relevance: entity["relevance"],
                                knowledge_graph_type_hierarchy: entity["knowledgeGraph"]["typeHierarchy"],
                                count: entity["count"],
                                text: entity["text"]
      end

      response_object["document"]["relations"].each do |relation|
        relation_record = document.relations.create! attribute: relation["attribute"]

        relation['keywords'].each do |keyword|
          relation_record.keywords.create! attribute: keyword["attribute"],
            knowledge_graph_type_hierarchy: keyword["knowledgeGraph"]["typeHierarchy"]


      end
    end

		document.entities.build name: @response["document"]["entities"]["name"]

	end

	def successful?
		true # make it true if everything saved successfully
	end
end
