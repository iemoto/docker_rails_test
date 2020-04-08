class BoardsController < ApplicationController
  before_action :set_target_board, only: [:show, :edit, :update, :destroy]

  def index
     @boards = Board.page(params[:page])
  end
  
  def new
    @board = Board.new
  end
  
  def create
    board = Board.create(board_params)
    redirect_to board
  end

  def show
    @board = Board.find(params[:id])
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board.update(board_params)

    redirect_to @board
  end

  def destroy
    @board.delete

    redirect_to boards_path
  end

  private

  def set_target_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end
