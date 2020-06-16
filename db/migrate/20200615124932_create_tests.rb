class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level

      t.timestamps

      t.references :categories, index: true, foreign_key: true
    end
  end
end
