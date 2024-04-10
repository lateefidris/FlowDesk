# == Schema Information
#
# Table name: desks
#
#  id              :integer          not null, primary key
#  bio             :text
#  location        :string
#  name            :string
#  profile_picture :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  professional_id :integer          not null
#
# Indexes
#
#  index_desks_on_professional_id  (professional_id) UNIQUE
#
# Foreign Keys
#
#  professional_id  (professional_id => users.id)
#
class Desk < ApplicationRecord
  belongs_to :professional, required: true, class_name: "User", foreign_key: "professional_id"
  validates :professional_id, uniqueness: true
  validates :name, uniqueness: { case_sensitive: false }, presence: true
  has_many  :categories, class_name: "Category", foreign_key: "desk_id", dependent: :destroy
  has_many  :bookings, class_name: "Booking", foreign_key: "desk_id", dependent: :destroy
  has_one  :availability, class_name: "Availability", foreign_key: "desk_id", dependent: :destroy
end
