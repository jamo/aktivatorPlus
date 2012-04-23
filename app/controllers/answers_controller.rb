class AnswersController < ApplicationController
 skip_before_filter :authorize, :only => [:new, :create]

  def new
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:question_id])
    if @question.active != true
      redirect_to course_question_path(@course, @question), :alert => "This question is not active!"
    end
    @answer = @question.answers.new(:course_id => params[:course_id], :question_id => params[:question_id])
  end

  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:question_id])
    @answer = @question.answers.build(:choice => 1, :question_id => @question_id, :course_id => @course_id, :answer_option_id => params[:answer_option_id])
    @answer.save! if @answer
    @comment =  @question.comments.build(:course_id => params[:course_id], :body => params[:comment])  unless params[:comment].blank?
    @comment.save! if @comment
    redirect_to course_question_path(@course, @question)
  end


end
