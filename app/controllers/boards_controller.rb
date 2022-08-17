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
      redirect_to board_path(@board), notice: 'Saved'
    else
      flash.now[:error] = 'Saving failed'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to board_path(@board), notice: 'Updated' 
    else
      flash.now[:error] = 'Updating failed'
      render :edit
    end  
  end

  private
  def board_params
    params.require(:board).permit(:name, :description)
  end
end
