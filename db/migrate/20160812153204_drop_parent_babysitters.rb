class DropParentBabysitters < ActiveRecord::Migration[5.0]
  def change
    drop_table :parent_babysitters
  end
end
