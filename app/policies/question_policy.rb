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

  def index?
    return true if @current_user
    false
  end

  def show?
    return true if @current_user
    false
  end

  def update?
    return true if @current_user
    false
  end

  def permitted_attributes(params)
    if params[:action] == 'update'
      [questions: [:id, :subject, :importance, :category, :body, :city, :email, :phone, :contact, :archive]]
    else
      params[:action] == 'create'
      [questions: [:id, :subject, :importance, :category, :body, :city, :email, :phone, :contact, :archive]]
    end
  end
end
