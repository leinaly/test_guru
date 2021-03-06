class AddTablesDefaults < ActiveRecord::Migration[6.0]
  def up
    add_column(:answers, :correct, :boolean, default: false)
    change_column :tests, :level, :integer, default: 1
  end

  def down
    remove_column(:answers, :correct)
    change_column :tests, :level, :integer, default: nil
  end
end
