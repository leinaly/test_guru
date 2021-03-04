class User < ApplicationRecord

  include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  has_secure_password

  def tests_with_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
        .where('tests_users.user_id = ? and tests.level = ?', self.id, level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
