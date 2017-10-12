class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def authorized?
    return true if @current_user
    false
  end

  def permitted_attributes(params)
    if params[:action] == 'update'
      [user: [:id, :email, :password, :password_confirmation]]
    else
      params[:action] == 'create'
      [user: [:id, :email, :password, :password_confirmation]]
    end
  end
end