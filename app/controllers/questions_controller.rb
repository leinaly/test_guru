class QuestionsController < ApplicationController

  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  #Просмотра списка вопросов теста
  def index
    @questions = @test.questions
  end

  #Просмотра конкретного вопроса теста
  def show
    render json: { question: @question }
  end

  #Создания вопроса. Используйте шаблон с HTML формой.
  # Идентификатор теста к которому принадлежит вопрос можно указать явно в составе URL значения атрибута action в тэге form
  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render json: { result: "Created!" }
    else
      render json: { result: "Smth was wrong!" }
    end
  end

  #Удаление вопроса
  def destroy
    @question.destroy

    render json: { result: "Deleted!"}
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Question was not found'
  end
end
