# frozen_string_literal: true

class Resturant < ApplicationRecord
  has_many :tables
  has_many :reservations
  has_many :users, through: :reservations

  # available tables on a given date
  def available_tables(date)
    ids = []
    tables.each do |table|
      ids << table.id if ReserveService.new(table, date).available_slots.present?
    end
    Table.where(id: ids)
  end
end
