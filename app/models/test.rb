class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  #has_and_belongs_to_many :users
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :author, class_name: 'User'

  scope :easy, -> { where(level: 0) }
  scope :elementary, -> { where(level: 1) }
  scope :advanced, -> { where(level: 2) }
  scope :hard, -> { where(level: 3) }
  scope :hero, -> { where(level: 4..Float::INFINITY) }

  scope :with_category, -> (category_name) {
    joins(:category).where(categories: { title: category_name })
  }

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.with_category_titles(cat_name)
    with_category(cat_name).order(title: :desc).pluck(:title)
  end
end
