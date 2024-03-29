# frozen_string_literal: true

class TableService
  def initialize(start_time, end_time, max_allowed_duration)
    @start_time = start_time
    @end_time = end_time
    @max_allowed_duration = max_allowed_duration
  end

  attr_reader :start_time, :end_time, :max_allowed_duration

  # return all available booking spots if none is booked.
  def slots
    output = []

    hours.each_with_index do |hour, index|
      j = index + 1

      next_hour = hours[j]
      # going through an array of hours of operation for a resturant
      while j < hours.length && next_hour - hour <= max_allowed_duration
        output << [hour, next_hour] if hour != next_hour
        j += 1
      end
    end

    output
  end

  private

  # all business hours in an number array
  def hours
    res = []

    (end_time - start_time + 1).times do |index|
      res << (start_time + index)
    end

    res
  end
end
