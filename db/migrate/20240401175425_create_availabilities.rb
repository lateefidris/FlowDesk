class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.references :desk, null: false, foreign_key: true
      t.string :day_of_the_week
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
