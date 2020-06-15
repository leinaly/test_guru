class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.string :type
      t.integer :question_id

      t.timestamps
    end
  end
end
