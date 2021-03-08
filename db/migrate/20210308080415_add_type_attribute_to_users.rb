class AddTypeAttributeToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column(:users, :type, :string, null: false, default: 'User')
    add_column(:users, :last_name, :string)
    rename_column(:users, :name, :first_name)
    add_index(:users, :type)
  end

  def down
    remove_column(:users, :type)
    remove_column(:users, :last_name)
    rename_column(:users, :first_name, :name)
    remove_index(:users, :type)
  end
end
