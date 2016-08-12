class ParentBabysitter < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitters
end
