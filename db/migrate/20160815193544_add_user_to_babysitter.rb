class AddUserToBabysitter < ActiveRecord::Migration[5.0]
  def change
    add_reference :babysitters, :user, foreign_key: true
  end
end
