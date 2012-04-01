class QuestionsController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.create(params[:course])
    redirect_to post_path(@post)
    debugger
  end
  
  def new
    @course = Course.find(params[:course_id])
   #@question = @course.questions.create(params[:course])
   #debugger
  end
  
  def show
    @course = Course.find(params[:course_id])
  end

end
