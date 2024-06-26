class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :time_in_minutes
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
