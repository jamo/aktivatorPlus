class AnswersController < ApplicationController
 skip_before_filter :authorize, :only => [:new, :create]
  
  def new
    #debugger
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:question_id])
    #miltei turha?
    @answer = @question.answers.new(:course_id => params[:course_id], :question_id => params[:question_id])
    #debugger


    # <li><%= q.title %> : <%= radio_button_tag 'answer_option_id', q.choice%> </li>
    # vanha answers#new lista
  end
  
  def create
    
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:question_id])
    @answer = @question.answers.build(:choice => 1, :question_id => @question_id, :course_id => @course_id, :answer_option_id => params[:answer_option_id])
    @answer.save! if @answer
    @comment =  @question.comments.build(:course_id => params[:course_id], :body => params[:comment])  unless params[:comment].blank?
    @comment.save! if @comment
    #debugger
    redirect_to course_question_path(@course, @question)
#    debugger
#    redirect_to  course_question_path(@course_id, @question_id)
    #unless params[:answer_option1].blank?
   
    
  end
  
  
end
