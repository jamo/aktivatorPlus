class AdminController < ApplicationController
   skip_before_filter :authorize, :only => [:index]
  def index
    @total_courses = Course.count
    @total_questions = Question.count
    @total_answer_options = AnswerOption.count
    @total_answers = Answer.count
  end
end
