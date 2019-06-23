class Api::V1::StocksController < ApplicationController
  def index
    @stocks = Stock.all
    render json: @stocks
  end

  def show
    @stock = Stock.find(params[:id])
    render json: @stock
  end

  private
  def stock_params
    params.require(:stock).permit(:name, :ticker, :num_shares, :curr_price)
  end
end
