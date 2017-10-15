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

  def activate_deactivate_consultation?
    if (@consultation.archive == false) 
      @consultation.update_column(:archive, true)
      redirect_to @consultation, notice: "Запрос отправлен в архив"
    else
      @consultation.update_column(:archive, false)
      redirect_to @consultation, notice: "Запрос извлечен из архива"
    end
  end

   #Randge by CATEGOTY
  def get_general_consultations?
     return true if @current_user
    false
  end

  def get_surgery_consultations?
     return true if @current_user
    false
  end

  # Range by IMPORTANCE
  def get_important_consultations?
     return true if @current_user
    false
  end

  def get_normal_consultations?
     return true if @current_user
    false
  end

  # Archive consultations
  def get_archive_consultations?
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