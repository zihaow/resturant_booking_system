class Table < ApplicationRecord
	belongs_to :resturant
	has_many :reservations

	# before_save :check_valid

	def reserved?(time)
		reservation = reservations.where('start_time <= ? AND end_time >= ?', time, time)

		!reservation.blank?
	end

	def reservations_on_date(date)
		reservations.where(start_time: date.beginning_of_day..date.end_of_day)
	end
end
