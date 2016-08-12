class AddAddressToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :address, :string
  end
end
