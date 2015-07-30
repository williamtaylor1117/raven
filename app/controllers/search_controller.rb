class SearchController < ApplicationController
  def index
  	@search = Document.search( *Document.search_params(params) )
  end
end
