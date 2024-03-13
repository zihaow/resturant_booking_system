class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :party_size
      t.integer :duration

      t.timestamps
    end
  end
end
