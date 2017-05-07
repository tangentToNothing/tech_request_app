namespace :locations do
	
	desc "Make Locations with correct room types"
	task :create => :environment do
		l = Location.new
		l.name = "1957 E St B12"
		l.room_type_id = RoomType.find_by(name: "Description: PC-equipped room with microphone options").id
		l.save!

		l = Location.new
		l.name = "1957 E St B14"
		l.room_type_id = RoomType.find_by(name: "Description: Bring Your Own Device room").id
		l.save!

		l = Location.new
		l.name = "1957 E St B16"
		l.room_type_id = RoomType.find_by(name: "Description: PC-equipped room").id
		l.save!

		l = Location.new
		l.name = "1957 E St B17"
		l.room_type_id = RoomType.find_by(name: "Description: PC-equipped room with limited microphones").id
		l.save!
	end
end