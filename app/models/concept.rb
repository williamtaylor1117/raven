class Concept < ActiveRecord::Base
  belongs_to :document, touch: true
  include ElasticsearchSearchable
end
