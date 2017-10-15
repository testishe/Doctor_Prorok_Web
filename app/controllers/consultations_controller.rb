class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:show, :edit, :update, :activate_deactivate_consultation]

  def index
    authorize Consultation
    @consultations = Consultation.where(archive: false)
  end

  def show
    authorize Consultation
  end

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to @consultation, notice: 'Consultation was successfully created.' }
        format.json { render :show, status: :created, location: @consultation }
      else
        format.html { render :new }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize Consultation
    respond_to do |format|
      if @consultation.update(consultation_params)
        format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
        format.json { render :show, status: :ok, location: @consultation }
      else
        format.html { render :edit }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  def activate_deactivate_consultation
    authorize Consultation
    if (@consultation.archive == false) 
      @consultation.update_column(:archive, true)
      redirect_to @consultation, notice: "Запрос отправлен в архив"
    else
      @consultation.update_column(:archive, false)
      redirect_to @consultation, notice: "Запрос извлечен из архива"
    end
  end

  #Randge by CATEGOTY
  def get_general_consultations
    authorize Consultation
    @consultations = Consultation.where(category: "Общий_вопрос").where(archive: false)
  end

  def get_surgery_consultations
    authorize Consultation
    @consultations = Consultation.where(category: "Хирургия").where(archive: false)
  end

  # Range by IMPORTANCE
  def get_important_consultations
    authorize Consultation
    @consultations = Consultation.where(importance: "Срочно").where(archive: false)
  end

  def get_normal_consultations
    authorize Consultation
    @consultations = Consultation.where(importance: "Нормально").where(archive: false)
  end

  # Archive consultations
  def get_archive_consultations
    authorize Consultation
    @consultations = Consultation.where(archive: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation
      @consultation = Consultation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultation_params
      params.fetch(:consultation, {}).permit(:id, :subject, :importance, :category, :body, :city, :skype, :email, :phone, :contact, :archive, :age, :gender, :last_name, :first_name, :patronymic_name, :chronic_diseases)
    end
end
