class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	def index
		if user_signed_in?
			welcome
		else
			render 'index'
		end
	end

	def welcome
		if current_user.has_role? :admin
			render 'welcome'
		elsif current_user.name == nil
			redirect_to :controller => 'users/registrations', :action => 'edit'
		elsif current_user.has_role?(:non_profit)
			render 'non_profit_welcome'
		elsif current_user.has_role?(:wizard)
			if current_user.team_id != nil
				@project = Project.find_by(team_id: current_user.team_id )
			end
			render 'sr_welcome'
		elsif current_user.has_role?(:acolyte)
			render 'jr_welcome'
		end
	end
end
