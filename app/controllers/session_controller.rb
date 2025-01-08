class SessionController < ApplicationController
  before_action(:user_exits, only: %i[create new])

  def new
    @user = User.new
  end

  def create
    #render(plain: params)
    #render(plain: user.inspect)
    #render(plain: session_params[:email])
    @user = User.find_by(email: session_params[:email])

    if @user.present? && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to(root_path)
    else
      render(:new)
    end
  end

  def destroy
    user_compliete_user_session
    redirect_to(root_path)
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

  def user_exits
    if user_signed_in? then
      redirect_to(root_path)
    end
  end
end
