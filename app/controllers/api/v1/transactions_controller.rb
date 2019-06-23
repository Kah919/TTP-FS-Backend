class Api::V1::TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def show
    @transaction = Transaction.find(params[:id])
    render json: @transaction
  end

  private
  def transaction_params
    params.require(:transaction).permit(:user_id, :stock_id)
  end
end
