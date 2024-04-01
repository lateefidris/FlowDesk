class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :desk, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.string :client_name
      t.string :client_email
      t.datetime :appointment

      t.timestamps
    end
  end
end
