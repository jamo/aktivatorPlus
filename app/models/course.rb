class Course < ActiveRecord::Base
    has_many :questions, :dependent => :destroy
end
