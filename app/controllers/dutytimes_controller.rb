class DutytimesController < ApplicationController
	def update
		@dutytime=Dutytime.find(params[:id])
		@dutytime.update_attributes(params[:dutytime])
		redirect_to User.find(@dutytime.user_id)
	end
end
