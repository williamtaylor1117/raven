class Sentiment < ActiveRecord::Base
  belongs_to :sentimentable, polymorphic: true
  belongs_to :relation_object
  belongs_to :document, touch: true
  
end
