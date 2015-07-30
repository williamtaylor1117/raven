class Entity < ActiveRecord::Base
  belongs_to :entityable, polymorphic: true
  belongs_to :document, touch: true
  has_one :sentiment, as: :sentimentable
  include ElasticsearchSearchable
end
