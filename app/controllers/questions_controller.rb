class QuestionsController < ApplicationController
  skip_before_filter :authorize, :only => [:show, :index]
  
  def new
    @course = Course.find(params[:course_id])
    @question = @course.questions.new
  end
  
  def create
    @course = Course.find(params[:course_id])
    
    @question = @course.questions.create(params[:question], :active => false)

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
    @answer_option11 = @question.answer_options.build(:choice => 11, :title => params[:answer_option11] )unless params[:answer_option11].blank?
    @answer_option12 = @question.answer_options.build(:choice => 12, :title => params[:answer_option12] )unless params[:answer_option12].blank?
    @answer_option13 = @question.answer_options.build(:choice => 13, :title => params[:answer_option13] )unless params[:answer_option13].blank?
    @answer_option14 = @question.answer_options.build(:choice => 14, :title => params[:answer_option14] )unless params[:answer_option14].blank?
    @answer_option15 = @question.answer_options.build(:choice => 15, :title => params[:answer_option15] )unless params[:answer_option15].blank?
    @answer_option16 = @question.answer_options.build(:choice => 16, :title => params[:answer_option16] )unless params[:answer_option16].blank?
    @answer_option17 = @question.answer_options.build(:choice => 17, :title => params[:answer_option17] )unless params[:answer_option17].blank?
    @answer_option18 = @question.answer_options.build(:choice => 18, :title => params[:answer_option18] )unless params[:answer_option18].blank?
    @answer_option19 = @question.answer_options.build(:choice => 19, :title => params[:answer_option19] )unless params[:answer_option19].blank?
    @answer_option20 = @question.answer_options.build(:choice => 20, :title => params[:answer_option20] )unless params[:answer_option20].blank?

    @answer_option1.save! if @answer_option1
    @answer_option2.save! if @answer_option2
    @answer_option3.save! if @answer_option3
    @answer_option4.save! if @answer_option4
    @answer_option5.save! if @answer_option5
    @answer_option6.save! if @answer_option6
    @answer_option7.save! if @answer_option7
    @answer_option8.save! if @answer_option8
    @answer_option9.save! if @answer_option9
    @answer_option10.save! if @answer_option10
    @answer_option11.save! if @answer_option11
    @answer_option12.save! if @answer_option12
    @answer_option13.save! if @answer_option13
    @answer_option14.save! if @answer_option14
    @answer_option15.save! if @answer_option15
    @answer_option16.save! if @answer_option16
    @answer_option17.save! if @answer_option17
    @answer_option18.save! if @answer_option18
    @answer_option19.save! if @answer_option19
    @answer_option20.save! if @answer_option10
    
    flash.keep
    redirect_to course_questions_path(@course)
  end

  def show
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:id])
    
    
    vastausTulokset = Array.new
    kysymykset = Array.new
    @question.answer_options.each do |ao| 
        kysymykset.push ao.title      
        vastausTulokset.push ao.answers.count
    end
    @asd = Gchart.pie_3d(:title => @question.name, :labels => kysymykset, :data => vastausTulokset, :size => "500x250", :bg => {:color => 'efefef'})
  
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
    
    @questions = @course.questions
    
  end
  
 
end