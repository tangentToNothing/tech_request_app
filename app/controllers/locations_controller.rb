class LocationsController < ApplicationController

	def get_room_type_id
		location = Location.find_by(name: params[:name])
		render json: RoomType.find(location.room_type_id)
	end

	def get_room_name
		@location = Location.find(params[:id])
		render json: @location
	end
end
