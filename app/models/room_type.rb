class RoomType < ActiveRecord::Base
	has_many :locations
end
