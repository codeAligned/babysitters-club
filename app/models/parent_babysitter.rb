class ParentBabysitter < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter
end
