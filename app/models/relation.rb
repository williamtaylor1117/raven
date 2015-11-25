class Relation < ActiveRecord::Base
  belongs_to :document, touch: true
  has_many :actions
  has_many :relation_objects
  has_many :keywords, as: :keywordable
  has_many :entities, as: :entityable
  
end
