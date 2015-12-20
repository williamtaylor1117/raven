require 'alchemyapi_ruby/alchemyapi'
require 'json'

class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @documents = Document.all
  end
  
  def show
    @document = Document.find(params[:id])
    @concepts = @document.concepts
    @entities = @document.entities
    @keywords = @document.keywords
    @relations = @document.relations
  end
  
  def create
    alchemy_api_parser = AlchemyapiParser.new(params, current_user)
    alchemy_api_parser.call

    if alchemy_api_parser.successful?
      flash[:notice] = "Input was successfully analyzed and persisted."
    else
      flash[:error] = "There was a problem analyzing your input. Please try again."
    end
    redirect_to documents_index_path
  end
    
  def destroy
     @document = Document.find(params[:id])
 
    if @document.destroy
      flash[:notice] = "\"#{@document.id}\" was deleted successfully."
      redirect_to documents_index_path
    else
      flash[:error] = "There was an error deleting this result."
      redirect_to documents_index_path
     end
   end
  
end