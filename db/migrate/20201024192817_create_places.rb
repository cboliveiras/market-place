class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :location
      t.integer :price_per_day
      t.string :name
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
