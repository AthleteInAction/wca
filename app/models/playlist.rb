class Playlist < ActiveRecord::Base

	before_create :set_clock

	def set_clock

		self.src = "https://api.soundcloud.com/tracks/#{self.track_id}/stream?client_id=#{SC.client_id}"

	end

end