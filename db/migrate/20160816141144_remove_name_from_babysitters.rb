class RemoveNameFromBabysitters < ActiveRecord::Migration[5.0]
  def change
    remove_column :babysitters, :name, :string
    remove_column :babysitters, :email, :string
  end
end
