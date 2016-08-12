class CreateParentBabysitters < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_babysitters do |t|
      t.references :parent, foreign_key: true
      t.references :babysitters, foreign_key: true

      t.timestamps
    end
  end
end
