class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized?

  private

  def user_not_authorized?(exception)
    flash[:error] = "Access denied"
    redirect_to root_path
  end
end
