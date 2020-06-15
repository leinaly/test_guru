class AddUsersNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :type, false)
  end
end
