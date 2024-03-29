require_relative '../../lib/lsf_adapter.rb'

class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :require_lecturer, only: [:new, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /subjects
  # GET /subjects.json
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      subject_search_term = SubjectSearchTerm.new(@keywords)
      @subjects = Subject.where(
        subject_search_term.where_clause,
        subject_search_term.where_args).
        order(subject_search_term.order)
    else
      if params[:semester_info]
        @subjects = Subject.where(semester_info: params[:semester_info])
      else
        @subjects = Subject.all
      end
    end

    @isVisible = is_new_subject_course_available
    @subject = @subject
  end

  def is_new_subject_course_available
    @visible = false
    if user_signed_in?
      @is_user_lecturer = current_user.role === 'lecturer'
      if user_signed_in? && @is_user_lecturer
        @visible = true
      end
    end
  end

  def calculate_ratings
    @subject = @subject
    @ratings = Hash.new
    @subject.courses.each do |course|
      course.ratings.each do |rating|
        @results = Hash[:difficulty, 0, :homework, 0, :praxis, 0]
        @prev_difficulty = @results[:difficulty]
        @results[:difficulty] = (@prev_difficulty + rating.difficulty)/2
        @prev_homework = @results[:homework]
        @results[:homework] = (@prev_homework + rating.homework)/2
        @prev_praxis = @results[:praxis]
        @results[:praxis] = (@prev_praxis + rating.praxis)/2
      end
      @ratings[course] = @results
    end
    @ratings
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @courses = @subject.courses
    @selected_course = @courses.first
    @subject = @subject
    @isVisible = is_new_subject_course_available
    @ratings = calculate_ratings
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    @awes = LsfAdapter.get_awe_courses
    @lecturer = get_user_lecturer
  end

  def get_user_lecturer
    @user_email = current_user.attributes['email']
    @lecturer = Lecturer.where(email: @user_email)
  end


  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def require_lecturer
    if user_signed_in?
      if current_user.role != 'lecturer'
        flash[:error] = 'You must be a lecturer to create, edit or destroy a subject.'
        redirect_to 'subjects#index'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :study_path)
    end
end
