class QuestionsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.create(params[:course])
    redirect_to course_questions_path(@course)
  #redirect_to courses# course_questions(@post)
  #debugger
  end

  def new
    @course = Course.find(params[:course_id])
    @question = @course.questions.new
  
  #redirect_to course_questions_pat
  end

  def show
    #tän pitäis näyttää vaan yksi kyssäri
    @course = Course.find(params[:course_id])
  end

  def index
    #näyttää listauksen kaikista kyssäreistä
    @course = Course.find(params[:course_id])
    
    @questions = @course.questions
  end

end
