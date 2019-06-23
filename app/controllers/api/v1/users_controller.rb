class Api::V1::UsersController < ApplicationController

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
    @user = User.find_by(email: user_login_params[:email])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :balance)
  end
end
