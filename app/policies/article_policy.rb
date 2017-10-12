class ArticlePolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @article = model
  end

  def authorized?
    return true if @current_user
    false
  end

  def index?
   return true if @current_user
    false
  end

  def permitted_attributes(params)
    if params[:action] == 'update'
      [article: [:id, :name, :category, :body, :picture, :archive]]
    else
      params[:action] == 'create'
      [article: [:id, :name, :category, :body, :picture, :archive]]
    end
  end
end