require 'rails_helper'

describe AlchemyapiParser do
  describe "save_document" do
    it "can save JSON responses from Alchemy API" do
      json_alchemy_response = File.read(Rails.root.join('test', 'fixtures', 'sample_response.json'))
      alchemy_response = JSON.parse json_alchemy_response

      alchemyapi_parser = AlchemyapiParser.new
      alchemyapi_parser.response = alchemy_response


      p alchemyapi_parser.response
      alchemyapi_parser.save_document

      expect { Document.count }.to have_changed_by(1)
    end
  end
end