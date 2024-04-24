# == Schema Information
#
# Table name: services
#
#  id              :integer          not null, primary key
#  description     :text
#  name            :string
#  price           :float
#  time_in_minutes :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  category_id     :integer          not null
#
# Indexes
#
#  index_services_on_category_id  (category_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
class Service < ApplicationRecord
  def time_in_hours
    if time_in_minutes.present? && time_in_minutes == 60
      "#{time_in_minutes / 60} hour"
    elsif time_in_minutes.present? && time_in_minutes > 59
      "#{time_in_minutes / 60} hours"
    else
      "#{time_in_minutes} minutes"
    end
  end

  belongs_to :category, required: true, class_name: "Category", foreign_key: "category_id"
  has_many  :bookings, class_name: "Booking", foreign_key: "service_id", dependent: :destroy
  has_one :desk, through: :category
  has_many_attached :images
end
