class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :edit, :activate_deactivate_question]
  helper_method :sort_column, :sort_direction

  def index
    authorize Question
    @questions = Question.where(archive: false)
  end

  def show
    authorize Question
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize Question
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def activate_deactivate_question
    authorize Question
    if (@question.archive == false) 
      @question.update_column(:archive, true)
      redirect_to @question, notice: "Вопрос отправлен в архив"
    else
      @question.update_column(:archive, false)
      redirect_to @question, notice: "Вопрос извлечен из архива"
    end
  end

  def get_general_questions
    authorize Question
    @questions = Question.where(category: "Общий_вопрос").where(archive: false)
  end

  def get_surgery_questions
    authorize Question
    @questions = Question.where(category: "Хирургия").where(archive: false)
  end

  def get_archive_questions
    authorize Question
    @questions = Question.where(archive: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.fetch(:question, {}).permit(:id, :category, :body, :city, :email, :phone, :contact, :archive, :age, :gender, :last_name, :first_name, :patronymic_name, :chronic_diseases)
    end

    def sort_column
      Question.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
