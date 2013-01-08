class ProfilesController < ApplicationController
	def update
		@profile=Profile.find(params[:id])
		@profile.update_attributes(params[:profile])
		redirect_to User.find(@profile.user_id)
	end
end
