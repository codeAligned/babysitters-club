class Request < ApplicationRecord
  belongs_to :parent
  belongs_to :babysitter

  def accept
    ParentBabysitter.create({parent_id: self.parent_id, babysitter_id: self.babysitter_id})
  end

end
