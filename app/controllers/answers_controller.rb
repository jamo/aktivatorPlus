class AnswersController < ApplicationController
  
  def new
    debugger
    @course = Course.find(params[:course_id])
    @question = @course.questions(params[:question_id])
    @answer = Course.question.answer.new
  end
  
  def create
    debugger
    @answer
    
    
  end
  
  
end
