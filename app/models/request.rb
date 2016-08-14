class Request < ApplicationRecord
  #this to accept network
  belongs_to :parent
  belongs_to :babysitter

  def accept
    ParentBabysitter.create({parent_id: self.parent_id, babysitter_id: self.babysitter_id})
    # request disappears
  end

  def self.all_babysitter_request(babysitter_id)
  	where('babysitter_id = ?', babysitter_id)
  end

  def self.all_parent_request(parent_id)
  	where('parent_id = ?', parent_id)
  end

end
