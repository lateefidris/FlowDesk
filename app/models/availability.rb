# == Schema Information
#
# Table name: availabilities
#
#  id              :integer          not null, primary key
#  day_of_the_week :string
#  end_time        :time
#  start_time      :time
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  desk_id         :integer          not null
#
# Indexes
#
#  index_availabilities_on_desk_id  (desk_id)
#
# Foreign Keys
#
#  desk_id  (desk_id => desks.id)
#
class Availability < ApplicationRecord
  belongs_to :desk
end
