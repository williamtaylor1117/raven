require 'alchemyAPI/alchemyapi'
require 'json'

class AlchemyController < ApplicationController
  
  def index
  end
  
  def query
  	alchemyapi = AlchemyAPI.new()
    response = alchemyapi.combined('url', params[:q],  {'extract'=>'page-image, title, author, concept' })
    puts JSON.pretty_generate(response)
      
    if 
      Document.create(result: response)
      flash[:notice] = "Input was successfully analyzed and persisted."
      redirect_to alchemy_search_path 

    else
      flash[:notice] = "Input was successfully analyzed and persisted."
      redirect_to alchemy_search_path 
    end
  end
end