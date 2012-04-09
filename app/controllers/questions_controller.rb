class QuestionsController < ApplicationController
  
  
  def new
    @course = Course.find(params[:course_id])
    @question = @course.questions.new
    #@answer_option1 = @question.answer_options.new
    #@answer_option2 = @question.answer_options.new
    #@answer_option3 = @question.answer_options.new
    #@answer_option4 = @question.answer_options.new
    #@answer_option5 = @question.answer_options.new
    #@answer_option6 = @question.answer_options.new
    #@answer_option7 = @question.answer_options.new
    #@answer_option8 = @question.answer_options.new
    #@answer_option9 = @question.answer_options.new
    #@answer_option10 = @question.answer_options.new

  end
  
  def create
    @course = Course.find(params[:course_id])
    @question = @course.questions.create(params[:question])

    @answer_option1 = @question.answer_options.build(:choice => 1, :title => params[:answer_option1]) unless params[:answer_option1].blank?
    @answer_option2 = @question.answer_options.build(:choice => 2, :title => params[:answer_option2]) unless params[:answer_option2].blank?
    @answer_option3 = @question.answer_options.build(:choice => 3, :title => params[:answer_option3]) unless params[:answer_option3].blank?
    @answer_option4 = @question.answer_options.build(:choice => 4, :title => params[:answer_option4]) unless params[:answer_option4].blank?
    @answer_option5 = @question.answer_options.build(:choice => 5, :title => params[:answer_option5]) unless params[:answer_option5].blank?
    @answer_option6 = @question.answer_options.build(:choice => 6, :title => params[:answer_option6]) unless params[:answer_option6].blank?
    @answer_option7 = @question.answer_options.build(:choice => 7, :title => params[:answer_option7]) unless params[:answer_option7].blank?
    @answer_option8 = @question.answer_options.build(:choice => 8, :title => params[:answer_option8]) unless params[:answer_option8].blank?
    @answer_option9 = @question.answer_options.build(:choice => 9, :title => params[:answer_option9]) unless params[:answer_option9].blank?
    @answer_option10 = @question.answer_options.build(:choice => 10, :title => params[:answer_option10] )unless params[:answer_option10].blank?

    @answer_option1.save! if @answer_option1
    @answer_option2.save! if @answer_option2
    @answer_option3.save! if @answer_option3
    @answer_option4.save! if @answer_option4
    @answer_option5.save! if @answer_option5
    @answer_option6.save! if @answer_option6
    #debugger
    @answer_option7.save! if @answer_option7
    @answer_option8.save! if @answer_option8
    @answer_option9.save! if @answer_option9
    @answer_option10.save! if @answer_option10
    
    redirect_to course_questions_path(@course)
  #redirect_to courses# course_questions(@post)
  #debugger
  end


  def show
    #tän pitäis näyttää vaan yksi kyssäri
    #debugger
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:id])
    
    #debugger
  end
  
  def edit
    #Tää varmasti väärin - mut nyt debuggauksen vuoksi täällä :D
    #tän pitäis näyttää vaan yksi kyssäri
    @course = Course.find(params[:course_id])
    
  end

  def index
    #näyttää listauksen kaikista kyssäreistä
    @course = Course.find(params[:course_id])
    
    @questions = @course.questions
    
  end

end
