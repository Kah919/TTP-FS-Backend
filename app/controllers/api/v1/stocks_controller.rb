class Api::V1::StocksController < ApplicationController
  skip_before_action :authorized
  def index
    @stocks = Stock.all
    render json: @stocks
  end

  def show
    @stock = Stock.find(params[:id])
    render json: @stock
  end

  def create
    @stock = Stock.create(stock_params)
    if @stock.valid?
      # Transaction.create(:stock_id => @stock.id, :user_id => current_user.id)
      render json: {recipe: StockSerializer.new(@stock)} #, user: UserSerializer.new(current_user)
    else
      render json: { error: 'failed to create stock' }, status: :not_acceptable
    end
  end


  private
  def stock_params
    params.require(:stock).permit(:name, :ticker, :open_price)
  end
end
