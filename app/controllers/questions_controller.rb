class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :edit]
  helper_method :sort_column, :sort_direction

  # GET /questions
  # GET /questions.json
  def index
    authorize Question
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    authorize Question
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  # POST /questions.json
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

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.fetch(:question, {}).permit(:id, :category, :body, :city, :email, :phone, :contact, :archive)
    end

    def sort_column
      Question.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
