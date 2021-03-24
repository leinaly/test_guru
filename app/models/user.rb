class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable,
         :trackable,
         :validatable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests_author, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  def tests_with_level(level)
    Test.joins('JOIN tests_users ON tests.id = tests_users.test_id')
        .where('tests_users.user_id = ? and tests.level = ?', self.id, level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

end
