class TestsController < ApplicationController

  #Просмотра списка тестов
  def index
    ts = Test.all

    render json: { tests: ts }
  end


end
