module UserAuthenticate
  extend ActiveSupport::Concern

  included do 

    private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
    end

    def user_signed_in?
      current_user.present?
    end

    def user_compliete_user_session
      session.delete(:user_id)
      #@current_user = nil
    end

    def require_authentication
      return if user_signed_in?
      
      flash[:message] = t('flash.message.need_regidster')
      redirect_to(root_path)
    end

    helper_method :current_user, :user_signed_in?

  end
end