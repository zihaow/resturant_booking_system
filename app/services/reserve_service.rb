class ReserveService
  def initialize(table, date)
    @table = table
    @date = date
  end

  attr_accessor :table, :date

  def available_slots
    slots = all_slots
    reserved_slots.each do |slot|
      slots = remaining_slots(slots, slot.first, slot.last)
    end
    @available_slots ||= slots
  end

  private

  def remaining_slots(slots, from, to)
      output = []
      slots.each do |set|
        output << set if set.last <= from || set.first >= to
      end
      output
  end

  def reserved_slots
    reservations = table.reservations_on_date(date)
    slots = []

    reservations.each do |reservation|
      slots << reservation.time_slot
    end

    @reserved_slots ||= slots
  end

  def all_slots
    @all_slots ||= TableService.new(
      resturant.from,
      resturant.to,
      resturant.max_allow_duration
    ).slots
  end

  def resturant
    @resturant ||= table.resturant
  end
end
