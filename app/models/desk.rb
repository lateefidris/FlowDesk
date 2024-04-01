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
#  index_desks_on_professional_id  (professional_id)
#
# Foreign Keys
#
#  professional_id  (professional_id => users.id)
#
class Desk < ApplicationRecord
  belongs_to :professional
end
