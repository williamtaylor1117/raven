class Keyword < ActiveRecord::Base
  belongs_to :keywordable, polymorphic: true
  has_one :sentiment, as: :sentimentable
  include ElasticsearchSearchable
end
