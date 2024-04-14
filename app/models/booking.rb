# == Schema Information
#
# Table name: bookings
#
#  id           :integer          not null, primary key
#  appointment  :datetime
#  client_email :string
#  client_name  :string
#  status       :string           default("pending")
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
  belongs_to :desk, required: true, class_name: "Desk", foreign_key: "desk_id"
  belongs_to :service, required: true, class_name: "Service", foreign_key: "service_id"
  enum status: { pending: "pending", confirmed: "confirmed", completed: "completed" }

  # Method to format the booking time range
  def formatted_time_range
    # Ensure 'appointment' is a Time object and calculate the end time
    start_time = appointment.to_time
    end_time = start_time + service.time_in_minutes.minutes

    # Format the start and end times
    formatted_start_time = if start_time.strftime("%M") == "00"
      start_time.strftime("%-l%p")
    else
      start_time.strftime("%-l:%M%p")
    end.upcase

    formatted_end_time = if end_time.strftime("%M") == "00"
        end_time.strftime("%-l%p")
      else
        end_time.strftime("%-l:%M%p")
      end.upcase

        "#{formatted_start_time}-#{formatted_end_time}"
      end

    def date_format
      self.appointment.strftime("%b%d").upcase 
    end
end
