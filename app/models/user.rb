class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  validates :name, presence: true
  validates :password, presence: true

  def tests_with_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
        .where('tests_users.user_id = ? and tests.level = ?', self.id, level)
  end
end
