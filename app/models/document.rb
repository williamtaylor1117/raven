class Document < ActiveRecord::Base
    belongs_to :user, touch: true
    has_many :keywords, as: :keywordable
    has_many :entities, as: :entityable
    has_many :concepts
    has_many :relations
    has_one :sentiment, as: :sentimentable

    after_update { self.concepts.each(&:touch) }
    after_update { self.entities.each(&:touch) }
    after_update { self.keywords.each(&:touch) }
    after_update { self.entity(&:touch) }
    after_update { self.relations.each(&:touch) }
    include ElasticsearchSearchable

    default_scope { order('created_at DESC') }
end
