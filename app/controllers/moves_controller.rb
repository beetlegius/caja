class MovesController < ApplicationController
  before_action :get_move, only: [:show, :update, :destroy]

  def index
    cash = Cash.find_by id: params[:cash_id]
    moves = cash.try(:moves) || Move.all
    render json: moves, status: 200
  end

  def show
    render json: @move, status: 200
  end

  def create
    cash = Cash.find params[:cash_id]
    cash.moves.create! move_params
    head 201
  end

  def update
    @move.update! move_params
    render json: @move, status: 200
  end

  def destroy
    @move.destroy
    head 204
  end

  protected

  def get_move
    @move = Move.find params[:id]
  end

  def move_params
    params.require(:move).permit(:ammount, :kind)
  end
end
