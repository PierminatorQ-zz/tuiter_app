class ApplicationController < ActionController::Base
    def after_sign_up_path_for(resource)
        redirect_to root_path, notice:"Bienvenido"
    end
end
