class Entity < ActiveRecord::Base
  belongs_to :entityable, polymorphic: true
  has_one :sentiment, as: :sentimentable
  include ElasticsearchSearchable
end
