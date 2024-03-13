# TODO: add enum property to determine if Reservation has been consumed by user
# TODO: add cancel attribute to Reservation table to allow others to view and book
class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :resturant
	belongs_to :table

	before_save :set_end_time

	validates :duration, numericality: {
		greater_than_or_equal_to: Float(ENV['MIN_TIME']),
		less_than_or_equal_to: Float(ENV['MAX_TIME'])
	}

	def time_slot
		start = start_time.strftime("%H").to_i
		finish = end_time.strftime("%H").to_i

		[start, finish]
	end

	private

	# minus 1 second because we want next hour to be available
	def set_end_time
		self.end_time = start_time + (duration * 60).minutes - 1.second
	end
end
