class Question < ActiveRecord::Base
  belongs_to :course
  has_many :answer_options
end
