class ConsultationPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @consultation = model
  end

  def authorized?
    return true if @current_user
    false
  end

  def permitted_attributes(params)
    if params[:action] == 'update'
      [consultation: [:id, :subject, :importance, :body, :city, :skype, :email, :phone, :archive]]
    else
      params[:action] == 'create'
      [consultation: [:id, :subject, :importance, :body, :city, :skype, :email, :phone, :archive]]
    end
  end
end