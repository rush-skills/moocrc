class VisitorsController < ApplicationController
	layout 'home'
	before_filter :check_user

	def check_user
		if user_signed_in?
			redirect_to '/home'
		end
	end
end
