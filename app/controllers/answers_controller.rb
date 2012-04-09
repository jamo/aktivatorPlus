class AnswersController < ApplicationController
  
  def new
    
    @course = Course.find(params[:course_id])
    @question = @course.question s(params[:question_id])
    @answer = Answer.new
    @answer_options = 
    debugger

  end
  
  def create
    @answer_option1 = @question.answer.build(:choice => params[:choice], :question_id => @question_id, :course_id => @course_id)
    
    
    #unless params[:answer_option1].blank?
   
    
  end
  
  
end
