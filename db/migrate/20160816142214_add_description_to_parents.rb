class AddDescriptionToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :specific_needs, :string
    add_column :parents, :extra_requests, :string
  end
end
