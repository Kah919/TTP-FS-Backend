class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
     @user = User.create(user_params)
     if @user.valid?
       render json: { user: UserSerializer.new(@user) }, status: :created
     else
       render json: { error: 'failed to create user' }, status: :not_acceptable
     end
   end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(user_params)
    @user.save
    render json: @user
  end

   private
   def user_params
     params.require(:user).permit(:name, :email, :password, :balance)
   end
end
