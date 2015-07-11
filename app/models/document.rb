class Document < ActiveRecord::Base
    belongs_to :user, touch: true

    include ElasticsearchSearchable

    default_scope { order('created_at DESC') }
end
