class AddTablesNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:users, :name, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :type, false)
    change_column_null(:questions, :body, false)
    change_column_null(:questions, :test_id, false)
    change_column_null(:categories, :title, false)
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :question_id, false)
  end
end
