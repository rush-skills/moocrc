class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @users = User.all
  end

  def update_courses
    @user = User.find(params[:id])
	response = HTTParty.get('https://api.coursera.org/api/users/v1/me/enrollments', headers:{ 'Authorization' => "Bearer "+ @user.token.to_s})
  	p response.to_s + "=============================="
  	response['courses'].each do |f|
  		if f and @user.courses.where(:name => f["name"]).empty?
  			course = HTTParty.get('https://api.coursera.org/api/catalog.v1/courses/'.to_s + f["id"].to_s + '?fields=shortDescription,photo,instructor'.to_s )
        # p 'https://api.coursera.org/api/catalog.v1/courses/'.to_s + f["id"].to_s + '?fields=shortDescription,photo,instructor'.to_s 
        # p course + "YYYYYYYYYOOOOOOOOOOOOOOOLLLLLLLLLLLLLOOOOOOOOOOOOOOO\n"
  			Course.create!(:name => f["name"], :user_id => @user.id,:image => f["photo"], :instructor => course["elements"][0]["instructor"], :description => course["elements"][0]["shortDescription"])
  		end
  	end
  	redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    @courses = @user.courses
  end

  def home
    @user = current_user
    @courses = @user.courses
  end
end
