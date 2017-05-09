class LocationsController < ApplicationController

	def get_room_type_id
		location = Location.find_by(name: params[:name])
		render json: RoomType.find(location.room_type_id)
	end

	def get_room_name
		@location = Location.find(params[:id])
		render json: @location
	end

	def create
		@location = Location.new(location_params)
		@location.save!
		redirect_to manage_event_form_path, notice: 'New Location Saved'
	end

	def destroy
		@location = Location.find(params[:id])
		@location.destroy!
		redirect_to manage_event_form_path, notice: 'Location Removed'
	end

	private 

	def location_params
		params.require(:location).permit(:name, :room_type_id)
	end
end
