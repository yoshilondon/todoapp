class TasksController < ApplicationController
  before_action :set_task, only: [:show ]

  def show    
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to board_path(board), notice: 'add task'
    else
      flash.now[:error] = 'add task failed'
      render :new
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :eyecatch)
  end

  def set_task
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
  end
end