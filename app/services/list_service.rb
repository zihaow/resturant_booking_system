# frozen_string_literal: true

class ListService
  def initialize(tables, time)
    @tables = tables
    @time = time
  end

  attr_reader :tables, :time

  def list
    output = []

    tables.each do |table|
      reservations = table.reservations
                          .where('start_time <= ? AND end_time >= ?', time, time)
                          .map { |reservation| { id: reservation.id, size: reservation.party_size } }
      output += reservations
    end

    output
  end
end
