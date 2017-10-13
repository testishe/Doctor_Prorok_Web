class AnswerPolicy < ApplicationPolicy
  before_action :authenticate_user!, except: [:index, :show]
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @answer = model
  end

  def authorized?
    return true if @current_user
    false
  end

  def permitted_attributes(params)
    if params[:action] == 'update'
      [answer: [:id, :name, :body, :archive]]
    else
      params[:action] == 'create'
      [answer: [:id, :name, :body, :archive]]
    end
  end
end