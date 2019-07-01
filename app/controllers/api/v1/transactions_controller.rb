class Api::V1::TransactionsController < ApplicationController
  skip_before_action :authorized

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def show
    @transaction = Transaction.find(params[:id])
    render json: @transaction
  end

  def create
  @transaction = Transaction.create(transaction_params)
  render json: @transaction
end

  private
  def transaction_params
    params.require(:transaction).permit(:user_id, :stock_id, :num_share)
  end
end
