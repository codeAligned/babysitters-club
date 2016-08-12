class AddKidCountToParents < ActiveRecord::Migration[5.0]
  def change
    add_column :parents, :kid_count, :integer
  end
end
