# frozen_string_literal: true

class TableReserve
  prepend SimpleCommand

  def initialize(payload)
    @payload = payload
  end

  def call
    return errors.add(:error, 'Resturant does not exist') unless resturant.present?

    find_available_and_book
  end

  attr_reader :payload

  private

  def find_available_and_book
    return errors.add(:error, 'No available tables') unless tables.present?

    book_reservation
  end

  def book_reservation
    tables.each do |table|
      bookable = !table.reserved?(user_chosen_time)

      return book(table) if bookable
    end
    errors.add(:error, 'No table availale at selected time range')
  end

  def book(table)
    Reservation.create!(
      start_time: user_chosen_time,
      duration: payload[:duration],
      party_size: payload[:party_size],
      table: table,
      user: user,
      resturant: resturant
    )
  end

  def user_chosen_time
    @user_chosen_time ||= DateTime.new(
      date.year,
      date.month,
      date.day,
      payload[:time]
    )
  end

  def tables
    @tables ||= resturant.available_tables(date).where('size >= ?', payload[:party_size])
  end

  # TODO: use Time.now instead of Time.zone.now for
  # now to simplifize need of timezone implementations.
  def date
    @date ||= Time.now.to_date
  end

  def resturant
    @resturant ||= Resturant.find_by(name: payload[:resturant])
  end

  # TODO: add User side validation to prevent creation of duplicate users
  def user
    @user ||= User.find_or_create_by(email: payload[:email])
  end
end
