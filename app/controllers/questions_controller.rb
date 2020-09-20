class QuestionsController < ApplicationController

  before_action :init_ex
  before_action :find_test, only: %i[index]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  #Просмотра списка вопросов теста
  def index
    @qs = @test.questions

  end

  #Просмотра конкретного вопроса теста
  def show
    @q = Question.find_by(test_id: params[:test_id], id: params[:id])

    render json: { questions: @q }
  end

  #Создания вопроса. Используйте шаблон с HTML формой.
  # Идентификатор теста к которому принадлежит вопрос можно указать явно в составе URL значения атрибута action в тэге form
  def create
    Question.create!(question_params)

   render json: { result: "Created!" }
  end

  def new

  end

  #Удаление вопроса
  def destroy
    Question.destroy(params[:id])

    render json: { result: "Deleted!"}
  end


  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def init_ex
    @ex = []
  end

  def rescue_with_test_not_found
    @ex << "Test was not found"
    render template: "questions/index"
  end


end
