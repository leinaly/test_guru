class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User'

  def self.with_category(category_name)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
        .where('categories.title = ?', category_name).order(title: :desc).pluck(:title)
  end
end
