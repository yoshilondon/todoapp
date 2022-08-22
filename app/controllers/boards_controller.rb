class BoardsController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update]
  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board), notice: 'Saved'
    else
      flash.now[:error] = 'Saving failed'
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: 'Updated'
    else
      flash.now[:error] = 'Updating failed'
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: 'Deleted'
  end

  private
  def board_params
    params.require(:board).permit(:name, :description)
  end

  def set_article
    @board = Board.find(params[:id])
  end
end
