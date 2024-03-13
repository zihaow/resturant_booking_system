class CreateResturants < ActiveRecord::Migration[6.1]
  def change
    create_table :resturants do |t|
      t.string :name
      t.integer :from
      t.integer :to
      t.integer :max_allow_duration

      t.timestamps
    end
  end
end
