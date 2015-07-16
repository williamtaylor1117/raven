class Concept < ActiveRecord::Base
  belongs_to :document
  include ElasticsearchSearchable
end
