namespace :room_types do
	
	desc "Task description"
	task :create => :environment do
		r = RoomType.new
		r.name = "Description: Bring Your Own Device room"
		r.save!

		r = RoomType.new
		r.name = "Description: PC-equipped room"
		r.save!

		r = RoomType.new
		r.name = "Description: PC-equipped room with limited microphones"
		r.save!

		r = RoomType.new
		r.name = "Description: PC-equipped room with microphone options"
		r.save!
	end
end