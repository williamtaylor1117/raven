require 'alchemyAPI/alchemyapi'
require 'json'

class AlchemyController < ApplicationController
  
  def index
  end
  
  def query
  	alchemyapi = AlchemyAPI.new()
    response = alchemyapi.combined('url', params[:q],  {'extract'=>'page-image, title, author, concept' })
    puts JSON.pretty_generate(response)
    json = JSON.parse(response)
    
    
  end

  def new
    @user = current_user
    @document = Document.new
  end
  
  def create
    @user = current_user
    @document = current_user.documents.build(document_params)
    
    if @document.save(document_params)
      flash[:notice] = "Input was successfully analyzed and persisted."
      redirect_to request.referrer
      
    else
      flash[:alert] = "There was an error analyzing the content. Please try again."
      redirect_to request.referrer
    end
  end
  
  private
  
  def item_params
    params.require(:document).permit(:result)
  end
end