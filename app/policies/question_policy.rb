class QuestionPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @question = model
  end

  def authorized?
    return true if @current_user
    false
  end

  def permitted_attributes(params)
    if params[:action] == 'update'
      [question: [:id, :subject, :importance, :category, :body, :city, :email, :phone, :contact, :archive]]
    else
      params[:action] == 'create'
      [question: [:id, :subject, :importance, :category, :body, :city, :email, :phone, :contact, :archive]]
    end
  end
end