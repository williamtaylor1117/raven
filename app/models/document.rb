class Document < ActiveRecord::Base
    belongs_to :user, touch: true
    has_many :keywords, as: :keywordable
    has_many :entities, as: :entityable
    has_many :concepts
    has_many :relations
    has_one :sentiment, as: :sentimentable

    

    default_scope { order('created_at DESC') }
end
