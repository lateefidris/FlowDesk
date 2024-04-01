# == Schema Information
#
# Table name: bookings
#
#  id           :integer          not null, primary key
#  appointment  :datetime
#  client_email :string
#  client_name  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  desk_id      :integer          not null
#  service_id   :integer          not null
#
# Indexes
#
#  index_bookings_on_desk_id     (desk_id)
#  index_bookings_on_service_id  (service_id)
#
# Foreign Keys
#
#  desk_id     (desk_id => desks.id)
#  service_id  (service_id => services.id)
#
class Booking < ApplicationRecord
  belongs_to :desk
  belongs_to :service
end
