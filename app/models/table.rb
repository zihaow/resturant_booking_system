class Table < ApplicationRecord
	belongs_to :resturant
	has_many :reservations

	def self.reservations_on_time(time)
		tables = select { |table| table.reserved?(time) }

		ListService.new(tables, time).list
	end

	def reserved?(time)
		reservation = reservations.where('start_time <= ? AND end_time >= ?', time, time)

		!reservation.blank?
	end

	def reservations_on_date(date)
		reservations.where(start_time: date.beginning_of_day..date.end_of_day)
	end
end
