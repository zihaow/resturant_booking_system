# frozen_string_literal: true

class AddResturantRefToTables < ActiveRecord::Migration[6.1]
  def change
    add_reference :tables, :resturant, null: false, foreign_key: true
  end
end
