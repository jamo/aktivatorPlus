class QuestionsController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.create(params[:course])
    redirect_to course_questions(@course)
    #redirect_to courses# course_questions(@post)
    #debugger
  end
  
  def new
    @course = Course.find(params[:course_id])
    @question = @course.questions.create(params[:course])
   #debugger
  end
  
  def show
    @course = Course.find(params[:course_id])
  end

end
