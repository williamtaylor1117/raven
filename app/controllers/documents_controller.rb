require 'alchemyapi_ruby/alchemyapi'
require 'json'

class DocumentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @documents = Document.all
    @concepts = Concept.all
    @entities = Entity.all
    @keywords = Keyword.all 
    @relations = Relation.all 
    @relation_objects = RelationObject.all 
    @sentiments = Sentiment.all 
  end
  
  def show
    @document = Document.find(params[:id])
    @concepts = Concept.where(document_id: @document.id)
    @entities = Entity.where(entityable_id: @document.id)
    @keywords = Keyword.where(keywordable_id: @document.id)
    #@relations = Relation.where 
    #@relation_objects = RelationObject.where 
    #@sentiments = Sentiment.where
  end
  
  def new
    @document = Document.new
  end
  
  def create
    alchemy_api_parser = AlchemyapiParser.new(params, current_user)
    alchemy_api_parser.call

    if alchemy_api_parser.successful?
      flash[:notice] = "Input was successfully analyzed and persisted."
      redirect_to documents_index_path
    else
      flash[:error] = "There was a problem analyzing your input. Please try again."
      redirect_to documents_index_path
    end
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