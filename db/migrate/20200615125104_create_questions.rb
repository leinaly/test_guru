class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body
      t.timestamps

      t.references :test, index: true, foreign_key: true
    end
  end
end
