class QuestionsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:show, :index]

  def new
    @course = Course.find(params[:course_id])
    @question = @course.questions.new
  end

  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.create(params[:question], :active => false)
    @number_of_answer_options = 20
     for i in (1..@number_of_answer_options)
        @question.answer_options.build(:choice => i, :title => params[('answer_option'+i.to_s).to_sym]).save! unless params[('answer_option'+i.to_s).to_sym].blank?
     end
    flash.keep
    redirect_to course_questions_path(@course)
  end

  def show
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:id])

    @vastausTulokset = Array.new
    @kysymykset = Array.new
    @question.answer_options.each do |ao|
      @kysymykset.push ao.title
      @vastausTulokset.push ao.answers.count
    end
    @chart = Gchart.pie_3d(:labels => @kysymykset, :data => @vastausTulokset, :size => "500x250", :bg => {:color => 'f8f8f8'})
    @answerCount = 0
    @vastausTulokset.each{ |int| @answerCount += int }
    @comments = Comment.find_all_by_question_id(@question.id)
    @admin = false
    @admin = User.find(session[:user_id]).administrator? unless session[:user_id] == nil

  end

  def activate
    redirect_to root_path unless current_user
    session[:return_to] = request.referer
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:id])
    if params[:activate] == "true"
      @question.update_attribute('active', true)
      redirect_to session[:return_to], :notice => "Question was successfully activated"
    else
      @question.update_attribute('active', false)
      redirect_to session[:return_to], :notice => "Question was succesfully deactivated"
    end
  end


  def index
    @course = Course.find(params[:course_id])
    if user_signed_in?
      @questions = @course.questions
    else
      @questions =  @course.questions.find(:all,:conditions => { :active => true})
    end
  end

  def destroy
    redirect_to root_path unless current_user.admin?
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:id])
    @question.destroy
    redirect_to course_questions_path(@course)
  end

  def get_link
    if user_signed_in?
      @link = course_question_path(@course.id, question)
    else
      @link = new_course_question_answer_path(@course.id, question)
    end

  end

end
