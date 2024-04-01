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
  belongs_to :category
end
