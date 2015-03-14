class CoursesController < ApplicationController
  def show
  	@course = Course.find(params[:id]);
  	@deadlines = @course.deadlines;
  end
  def index
  	@courses = Course.all
  end
  def create_deadline
  	@course = Course.find(params[:id]) 
  	@deadline = Deadline.new
  end
  def deadline_save
  	# @deadline = Deadline.find(params[:id])
    @deadline= Deadline.new(deadline_params)
    @deadline.completed==0
    @course = @deadline.course
  	@deadline.save!
  	redirect_to @course
  end

  def completed
    @deadline = Deadline.find(params[:id])
    @deadline.completed = 1
    @deadline.save!
    redirect_to @deadline.course
  end

  def failed
    @deadline = Deadline.find(params[:id])
    @deadline.completed = -1
    @deadline.save!
    redirect_to @deadline.course
  end
  private

  def deadline_params
      params.require(:deadline).permit(:title, :completed, :course_id)
    end
end
