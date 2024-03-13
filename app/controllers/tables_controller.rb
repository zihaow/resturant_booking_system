class TablesController < ApplicationController
  def list
    reserved_slots = Table.reservations_on_time(time)

    render json: reserved_slots, status: 200
  end

  private

  # TODO: parse time in the format of YY/MM/DD/hh/mm/ss
  def time
    date = Time.now.to_date
    @time ||= DateTime.new(
      date.year,
      date.month,
      date.day,
      table_params[:time]
    )
  end

  def table_params
    params.permit(:time, :resturant)
  end
end
