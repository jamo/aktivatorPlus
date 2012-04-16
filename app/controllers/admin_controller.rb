class AdminController < ApplicationController
  def index
    #debugger
    @total_courses = Course.count
    @total_questions = Question.count
    @total_answer_options = AnswerOption.count
    @total_answers = Answer.count
  end
end
