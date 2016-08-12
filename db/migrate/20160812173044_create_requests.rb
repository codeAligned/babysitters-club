class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :parent_id
      t.integer :babysitter_id

      t.timestamps
    end
  end
end
