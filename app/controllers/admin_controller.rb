class AdminController < ApplicationController
   skip_before_filter :authenticate_user, :only => [:index]

  def index
    current_user
    @total_courses = Course.count
    @total_questions = Question.count
    @total_answer_options = AnswerOption.count
    @total_answers = Answer.count
  end
end
