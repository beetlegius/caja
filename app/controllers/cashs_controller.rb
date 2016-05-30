class CashsController < ApplicationController
  before_action :get_cash, only: [:show, :update, :destroy]

  def index
    cashs = Cash.all
    render json: cashs, status: 200
  end

  def show
    render json: @cash, status: 200
  end

  def create
    Cash.create! cash_params
    head 201
  end

  def update
    @cash.update! cash_params
    render json: @cash, status: 200
  end

  def destroy
    @cash.destroy
    head 204
  end

  protected

  def get_cash
    @cash = Cash.find params[:id]
  end

  def cash_params
    params.require(:cash).permit(:name)
  end

end
