class AlchemyapiParser
	
def intialize(response)
	@response = response
end

	def call
		@response[entities]
	end
end
