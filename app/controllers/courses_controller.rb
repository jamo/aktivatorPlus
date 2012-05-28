class CoursesController < ApplicationController
   skip_before_filter :authenticate_user!, :only => [:index, :show]
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])
    respond_to do |format|
      if @course.save
        format.html { redirect_to course_questions_path(@course), notice: 'Course was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end


  def update

    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to courses_path, notice: 'Course was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    redirect_to root_path unless current_user.admin?
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_path

  end

  def comments
    redirect_to root_path unless current_user.admin?
    @course = Course.find(params[:id])
  end
end
