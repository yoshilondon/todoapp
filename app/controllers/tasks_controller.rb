class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]

  def show 
    @comments = @task.comments.includes(:user) 
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
      redirect_to board_path(board), notice: 'task added'
    else
      flash.now[:error] = 'add task failed'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to board_task_path(@task.board, @task), notice: 'task updated'
    else
      flash.now[:error] = 'update task failed'
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:board_id])
    task = board.tasks.find(params[:id])
    task.destroy!
    redirect_to board_path(board), notice: 'task deleted'
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