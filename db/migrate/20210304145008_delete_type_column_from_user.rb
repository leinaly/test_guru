class DeleteTypeColumnFromUser < ActiveRecord::Migration[6.0]
  def up
    remove_column(:users, :type)
  end

  def down
    add_column(:users, :type, :string)
  end
end
