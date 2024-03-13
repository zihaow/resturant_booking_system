# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reservations
  has_many :resturants, through: :reservations
end
