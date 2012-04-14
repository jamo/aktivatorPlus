class AnswersController < ApplicationController
  
  def new
    #debugger
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:question_id])
    @answer = @question.answers.new(:course_id => params[:course_id], :question_id => params[:question_id])
    #debugger

  end
  
  def create
    @answer_option1 = @question.answer.build(:choice => params[:choice], :question_id => @question_id, :course_id => @course_id)
    
    
    #unless params[:answer_option1].blank?
   
    
  end
  
  
end
