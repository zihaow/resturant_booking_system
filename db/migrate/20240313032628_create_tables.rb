# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.integer :size

      t.timestamps
    end
  end
end
