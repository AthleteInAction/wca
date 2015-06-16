class SplashController < ApplicationController

	skip_before_filter :authorize

	def index

		if current_user.nil?

			@user = User.new
			
			render layout: 'splash'

		else

			redirect_to dashboard_path

		end

	end

end