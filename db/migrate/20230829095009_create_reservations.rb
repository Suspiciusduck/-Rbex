class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :total_price
      t.references :user, null: false, foreign_key: true
      t.references :add, null: false, foreign_key: true

      t.timestamps
    end
  end
end
