class ParentBabysitter < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter
  has_one :review
end
