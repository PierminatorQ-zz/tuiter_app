class ApplicationController < ActionController::Base
    def after_sign_up_path_for(resource)
        redirect_to root_path, notice:"Bienvenido"
    end

    def authenticate_admin!
        redirect_to new_user_session_path unless current_user.admin && !current_user.nil?
    end


    
end
