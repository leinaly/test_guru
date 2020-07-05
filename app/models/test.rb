class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User'

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :with_category, -> (category_name) {
    joins(:category).where(categories: { title: category_name }).order(title: :desc).pluck(:title)
  }

  validates :title, presence: true
  validates :level, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates_uniqueness_of :title, scope: :level
end
