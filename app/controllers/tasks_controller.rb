class TasksController < ApplicationController
  def show
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end
end