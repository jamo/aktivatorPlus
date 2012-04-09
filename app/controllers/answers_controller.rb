class AnswersController < ApplicationController
  
  def new
    
    @course = Course.find(params[:course_id])
    @question = @course.questions(params[:question_id])
    
    @answer = Answer.new
    debugger
    
  end
  
  def create
    
    
    
  end
  
  
end
