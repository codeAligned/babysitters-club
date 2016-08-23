class AddParentIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :parent_id, :integer
    add_column :reviews, :babysitter_id, :integer
  end
end
