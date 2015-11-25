class Concept < ActiveRecord::Base
  belongs_to :document, touch: true
end
