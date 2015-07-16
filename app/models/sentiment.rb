class Sentiment < ActiveRecord::Base
  belongs_to :sentimentable, polymorphic: true
  belongs_to :document
  include ElasticsearchSearchable
end
