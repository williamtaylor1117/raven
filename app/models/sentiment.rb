class Sentiment < ActiveRecord::Base
  belongs_to :sentimentable, polymorphic: true
  include ElasticsearchSearchable
end
