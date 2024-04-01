class CreateDesks < ActiveRecord::Migration[7.0]
  def change
    create_table :desks do |t|
      t.string :name
      t.text :bio
      t.string :location
      t.string :profile_picture
      t.references :professional, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
