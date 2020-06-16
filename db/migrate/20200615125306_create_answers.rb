class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.string :type
      t.timestamps

      t.references :question, index: true, foreign_key: true
    end
  end
end
