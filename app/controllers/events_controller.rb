class EventsController < ApplicationController

	def index
		if user_signed_in?
			@events = Event.all
		else
			redirect_to root_path
		end
	end

	def new
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create
		@event = Event.new(event_params)
		@event.save!
		render json: @event
	end

	def destroy
		if user_signed_in?
			
		else
			redirect_to root_path
		end
	end

	def model

	end

	def manage
		if user_signed_in?
			@locations = Location.all
			@location = Location.new

			@room_types = RoomType.all
		else
			root_path
		end
	end

	private

	def event_params
		params.require(:event).permit(:email, :name, :phone_number, :department, :payment_method, :eas_account, :event_type, :event_name, :reservation_number, :event_date, :start_time, :end_time, :multi_day, :location_id, :wireless_handheld, :wireless_lav, :wired_handheld, :table_stands, :floor_stands, :web_conferencing, :press_feed, :third_party, :third_party_name, :additional_laptops, :additional_laptops_count, :comments)
	end
end
