# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  desk_id    :integer          not null
#
# Indexes
#
#  index_categories_on_desk_id  (desk_id)
#
# Foreign Keys
#
#  desk_id  (desk_id => desks.id)
#
class Category < ApplicationRecord
  belongs_to :desk, required: true, class_name: "Desk", foreign_key: "desk_id"
  has_many  :services, class_name: "Service", foreign_key: "category_id", dependent: :destroy
end
