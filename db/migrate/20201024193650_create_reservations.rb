class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :initial_date
      t.date :final_date
      t.integer :price
      t.references :user, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
