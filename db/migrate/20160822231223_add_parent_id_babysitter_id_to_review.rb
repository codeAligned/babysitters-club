class AddParentIdBabysitterIdToReview < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :babysitter, foreign_key: true
    add_reference :reviews, :parent, foreign_key: true
  end
end
