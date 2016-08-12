class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :parent, foreign_key: true
      t.references :babysitter, foreign_key: true
      t.string :title
      t.text :review
      t.integer :rating

      t.timestamps
    end
  end
end
