class CreateParentBabysitters < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_babysitters do |t|
      t.integer :parent_id
      t.integer :babysitter_id

      t.timestamps
    end
  end
end
