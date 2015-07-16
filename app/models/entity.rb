class Entity < ActiveRecord::Base
  belongs_to :entityable, polymorphic: true
  belongs_to :document
  include ElasticsearchSearchable
end
