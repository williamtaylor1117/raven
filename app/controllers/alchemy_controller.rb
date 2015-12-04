require 'alchemyAPI_ruby/alchemyapi'
require 'json'

class AlchemyController < ApplicationController
  before_action :authenticate_user!

  def index

    @document = Document.find(params[:id])
    @documents = Document.all
    @concepts = Concept.all
    @entities = Entity.all
    @keywords = Keyword.all 
    @relations = Relation.all 
    @relation_objects = RelationObject.all 
    @sentiments = Sentiment.all 

  end

  def create

    alchemy_api_parser = AlchemyapiParser.new(params, current_user)
    alchemy_api_parser.call

    # alchemyapi = AlchemyAPI.new()
    # #response = alchemyapi.combined(params[:type], params[:q],  {'extract'=>'title, author' })
    # response = alchemyapi.combined(params[:type], params[:q],  {'extract'=>'page-image, title, author, concept, doc-sentiment, keyword, entity, relation ','sentiment'=>1, 'knowledgeGraph'=>1  })
    #


    if alchemy_api_parser.successful?
      # current_user.documents.create(result: response)
      flash[:notice] = "Input was successfully analyzed and persisted."
      redirect_to alchemy_index_path
    else
      flash[:error] = "There was a problem analyzing your input. Please try again."
      redirect_to alchemy_index_path
    end
  end

  def destroy
     @document = Document.find(params[:id])
 
    if @document.destroy
      flash[:notice] = "\"#{@document.id}\" was deleted successfully."
      redirect_to alchemy_index_path
    else
      flash[:error] = "There was an error deleting this result."
      redirect_to alchemy_index_path
     end
   end
end