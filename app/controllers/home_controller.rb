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
		if current_user.has_role?(:non_profit)
			render 'non_profit_welcome'
		elsif current_user.has_role?(:wizard)
			render 'sr_welcome'
		elsif current_user.has_role?(:acolyte)
			render 'jr_welcome'
		end
	end
end
