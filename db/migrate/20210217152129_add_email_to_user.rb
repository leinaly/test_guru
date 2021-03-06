class AddEmailToUser < ActiveRecord::Migration[6.0]
  def up
    add_column(:users, :email, :string, unique: true)
  end

  def down
    remove_column(:users, :email)
  end
end
