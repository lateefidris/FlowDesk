class FixUniqueIndexOnDesksProfessionalId < ActiveRecord::Migration[7.0]
  def change
    remove_index :desks, :professional_id if index_exists?(:desks, :professional_id)
    add_index :desks, :professional_id, unique: true
  end
end
