class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :require_login

  def current_user
    User.where(id: session[:user_id]).first
  end

	def search_params
   		params.require(:search_form).permit(:search_for)
   	end
   	
  private 
  	helper_method :current_user

    def require_login
      unless !current_user.nil?
        respond_to do |format|
          format.html do
            flash[:error] = "You must be logged in to access this content."
            redirect_to login_path
          end
          format.js do
            render 'sessions/fail'
          end
        end
      end
    end

end