class BoardsController < ApplicationController
  before_action :find_board, only: [:favorite, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @boards = Board.all
  end

  def show
    @posts = @board.posts.includes(:user)
  end
  
  def favorite 
    current_user.toggle_favorite_board(@board)
    redirect_to favorites_path, notice: "更新我的最愛成功!"
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.create(board_params)

    if @board.save 
      redirect_to boards_path, notice: "新增成功！！"
    else
      render :new, notice: "errror"
    end
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: "更新成功"
    else
      render :edit, notice: "error"
    end
  end

  def destroy
    @board.destroy 
    redirect_to boards_path, notice: "刪除成功"
  end

  private
  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    #strong parameters
    params.require(:board).permit(:title, :intro)
  end
end
