class Keyword < ActiveRecord::Base
  belongs_to :document, touch: true
  belongs_to :keywordable, polymorphic: true
  has_one :sentiment, as: :sentimentable
  
end
