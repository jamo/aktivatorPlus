class CommentsController < ApplicationController
  def index
    #Näyttää kysymykseen kuuluvat kommentit
    @course = Course.find(params[:course_id])
    @question = @course.questions.find(params[:question_id])
    @comments =  Comment.find_all_by_question_id(params[:question_id])

  end


end
