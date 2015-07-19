class Action < ActiveRecord::Base
  belongs_to :relation
  include ElasticsearchSearchable
end
