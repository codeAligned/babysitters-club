class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :parent_babysitter, foreign_key: true
      t.string :title
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
