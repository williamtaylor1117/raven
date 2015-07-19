class Document < ActiveRecord::Base
    belongs_to :user, touch: true
    has_many :keywords, as: :keywordable
    has_many :entities, as: :entityable
    has_many :concepts
    has_one :sentiment, as: :sentimentable
    include ElasticsearchSearchable

    default_scope { order('created_at DESC') }
end
