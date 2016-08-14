class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :parent_babysitter_id
      t.string :title
      t.string :description
      t.integer :rating
    end
  end
end
