class RelationObject < ActiveRecord::Base
  belongs_to :relation
  has_one :sentiment, as: :sentimentable
  has_many :keywords, as: :keywordable
  has_many :entities, as: :entityable
  include ElasticsearchSearchable
end
