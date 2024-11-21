class CustomAttribute < ApplicationRecord
  belongs_to :customizable, polymorphic: true

  validates :attribute_name, presence: true
  validates :attribute_value, presence: true
end
