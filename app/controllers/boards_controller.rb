class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end
  
  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  private
  def board_params
    params.require(:board).permit(:name, :description)
  end
end
