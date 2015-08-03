class SearchController < ApplicationController
  def index
  	@search = Document.search( *Document.search_params(params) )
    #@search = Document.entities.search(*Document.search_params(params))
    #@search = Document.keywords.search(*Document.search_params(params))

  end
end
