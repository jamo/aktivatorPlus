require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  test "should get comments" do
    get :comments
    assert_response :success
  end

end
