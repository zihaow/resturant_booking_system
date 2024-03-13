class ReservationsController < ApplicationController
  # before_action :validate_jwt, only: %I[reserve]

  def reserve
    command = TableReserve.call(reserve_params)
    return render head: :ok if command.success?

    render json: command.errors, status: 400
  end

  private

  def reserve_params
    params.permit(:resturant, :email, :time, :duration, :party_size)
  end
end
