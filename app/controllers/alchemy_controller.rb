require 'alchemyAPI/alchemyapi'
require 'json'

class AlchemyController < ApplicationController
  
  def index
    @documents = Document.all
  end

  def create
    alchemyapi = AlchemyAPI.new()
    response = alchemyapi.combined('url', params[:q],  {'extract'=>'title, concept' })
     
    if 
      @user = current_user
      @user.documents.create(result: response)
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