class PropertyController < ApplicationController
	def update
		@property=Property.find(params[:id])
		@property.update_attributes(params[:property])
		redirect_to editproperty_path
	end
	def edit
		@properties=Property.all
	end
end
