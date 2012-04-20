class Question < ActiveRecord::Base
  belongs_to :course
  has_many :answer_options, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
