class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
  end

  def update_courses
    @user = User.find(params[:id])
	response = HTTParty.get('https://api.coursera.org/api/users/v1/me/enrollments', headers:{ 'Authorization' => "Bearer "+ @user.token.to_s})
  	p response.to_s + "=============================="
  	response['courses'].each do |f|
  		if f and @user.courses.where(:name => f.name).nil
  			course = HTTParty.get('https://api.coursera.org/api/users/v1/courses/'.to_s + f.id.to_s + '?fields=shortDescription,photo,instructor'.to_s )
  			p course.to_s
  			# Course.create!(:name => f.name, :user_id => @user.id,:cid =>f.id,:image => f.photo)
  		end
  	end
  	redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    @courses = @user.courses
  end
end
