class QuestionsController < ApplicationController

  def create
    debugger
    @course = Course.find(params[:course_id])
    @question = @Course.questions.create(params[:course])
    redirect_to post_path(@post)
  end
  
  def show
    @course = Course.find(params[:course_id])
  end

end
