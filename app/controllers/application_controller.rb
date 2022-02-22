class ApplicationController < ActionController::Base

    rescue_from CanCan::AccessDenied do |exception|
        flash[:alert] = "Access interdit"
        redirect_to main_app.root_url
    end
end
