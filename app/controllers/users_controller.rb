class UsersController < ApplicationController
  before_action(:user_exits, only: %i[create new])

  def index
    
  end

  def new
    @user = User.new
  end

  def create
    #render(plain: params.require(:user))
  
    @user = User.new(user_params)

    if @user.save then
      session[:user_id] = @user.id
      redirect_to(root_path)
      
      #render(plain: session[:user_id])
    else
      render :new
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def user_exits
    if user_signed_in? then
      redirect_to(root_path)
    end
  end
end
