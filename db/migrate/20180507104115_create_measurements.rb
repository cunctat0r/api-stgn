class CreateMeasurements < ActiveRecord::Migration[5.2]
  def change
    create_table :measurements do |t|
      15.times do |sensor_number|
        t.decimal "F#{sensor_number}".to_sym
        t.decimal "T#{sensor_number}".to_sym
      end
      t.decimal :Upit
      t.decimal :wind_direction
      t.decimal :wind_speed

      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
