class PostsController < ApplicationController
  def index
  
  end
  
  def new
    @board = Board.find(params[:board_id])
    @post = @board.posts.new
  end
  
  def create
  
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def show
  
  end
  
  def destroy
  
  end
end
