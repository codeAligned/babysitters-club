class AddColumnAgeToBabysitters < ActiveRecord::Migration[5.0]
  def change
    add_column :babysitters, :age, :integer
    add_column :babysitters, :location, :string
    add_column :babysitters, :bio, :string
    add_column :babysitters, :skills, :string
  end
end
