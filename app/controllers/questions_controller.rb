class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index show create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  #Просмотра списка вопросов теста
  def index
    @questions = @test.questions
  end

  #Просмотра конкретного вопроса теста
  def show
    @question = Question.find_by(id: params[:id])

    render json: { questions: @question }
  end

  #Создания вопроса. Используйте шаблон с HTML формой.
  # Идентификатор теста к которому принадлежит вопрос можно указать явно в составе URL значения атрибута action в тэге form
  def create
    msg = "Created!"
    begin
      Question.create!(question_params)
    rescue ActiveRecord::RecordInvalid => ex
      msg = "Not created! Smth goes wrong."
    end

   render json: { result: msg }
  end

  #Удаление вопроса
  def destroy
    Question.destroy(params[:id])

    render json: { result: "Deleted!"}
  end

  private

  def question_params
    params.require(:question).permit(:body).merge(test_id: @test.id)
  end

  def find_test
    @test = Test.find(params[:test_id]) if params[:test_id].present?
  end

  def rescue_with_test_not_found
    render plain: 'Question was not found'
  end
end
