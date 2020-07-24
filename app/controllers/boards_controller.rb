class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end
  
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save 
      redirect_to root_path, notice: "新增成功！！"
    else
      render :new, notice: "errror"
    end
  end

  private
  def board_params
    #strong parameters
    params.require(:board).permit(:title, :intro)
  end
end
