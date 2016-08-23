class RemoveParentBabysitterFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_column :reviews, :parent_babysitter_id, :integer
  end
end
