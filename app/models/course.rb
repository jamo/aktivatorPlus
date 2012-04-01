class Course < ActiveRecord::Base
    has_many :questions
end
