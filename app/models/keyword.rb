class Keyword < ActiveRecord::Base
  belongs_to :keywordable, polymorphic: true
  include ElasticsearchSearchable
end
