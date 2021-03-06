class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  after_validation :after_validation_set_next_question, on: :update

  SUCCESS_PERCENT = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def success?
    percents >= SUCCESS_PERCENT
  end

  def percents
    self.correct_questions * 100 / questions_count
  end

  def question_number
    questions_count - remained_questions.count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def after_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def questions_count
    test.questions.count
  end

  def remained_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def next_question
    remained_questions.first
  end
end
