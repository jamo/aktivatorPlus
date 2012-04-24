class QuestionsController < ApplicationController
  skip_before_filter :authorize, :only => [:show, :index]

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
    @asd = Gchart.pie_3d(:title => @question.name, :labels => @kysymykset, :data => @vastausTulokset, :size => "500x250", :bg => {:color => 'efefef'})
    @comments =    Comment.find_all_by_question_id(@question.id)
  end

  def activate
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
    if session[:user_id]
      @questions = @course.questions
    else
      @questions =  @course.questions.find(:all,:conditions => { :active => true})
    end
  end

end
