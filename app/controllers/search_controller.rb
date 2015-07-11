class SearchController < ApplicationController
  def index
  	@search = User.search( *User.search_params(params) )
  end
end
