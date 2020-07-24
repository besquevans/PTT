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

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])

    if @board.update(board_params)
      redirect_to boards_path, notice: "更新成功"
    else
      render :edit, notice: "error"
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy 
    redirect_to boards_path, notice: "刪除成功"
  end

  private
  def board_params
    #strong parameters
    params.require(:board).permit(:title, :intro)
  end
end
