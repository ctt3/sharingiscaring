class StaticPagesController < ApplicationController

	def index
		unless user_signed_in?
			redirect_to new_user_session_path
		else
			render :home
		end
	end

	def home
		render :home
	end

end
