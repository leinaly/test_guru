class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :validate_answers_amount

  private

  def validate_answers_amount
    #errors.add(:question) if self.question.answers.count >= 4
  end
end
