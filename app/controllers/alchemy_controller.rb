require 'alchemyAPI/alchemyapi'
require 'json'

class AlchemyController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @documents = Document.all
  end

  def create
    alchemyapi = AlchemyAPI.new()
    #response = alchemyapi.combined(params[:type], params[:q],  {'extract'=>'title, author' })
    response = alchemyapi.combined(params[:type], params[:q],  {'extract'=>'page-image, title, author, concept, doc-sentiment, keyword, entity, relation ','sentiment'=>1, 'knowledgeGraph'=>1  })
    

    if 
      current_user.documents.create(result: response)
      flash[:notice] = "Input was successfully analyzed and persisted."
      redirect_to alchemy_index_path
    else
      flash[:error] = "There was a problem analyzing your input. Please try again."
      redirect_to alchemy_index_path
    end
  end

  def destroy
    @document.destroy
    respond_to do |format|
      format.html {redirect_to action: 'index'}
      format.json {head :no_content}
    end
  end
end