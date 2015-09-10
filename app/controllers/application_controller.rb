class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  add_flash_types :success, :warning, :danger, :info
  protect_from_forgery with: :exception
  before_action :authenticate_usuario!

  private

  def usuario_admin
  	unless current_usuario.admin?
    	raise ActionController::RoutingError.new('Not Found')
  	end
  end

end
