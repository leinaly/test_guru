class CreateJoinTableUserTest < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :tests, index: true, foreign_key: true do |t|
      t.string :status, default: 'assigned'
    end
  end
end
