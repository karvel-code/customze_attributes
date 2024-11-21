class CustomAttribute < ApplicationRecord
  belongs_to :customizable, polymorphic: true

  validates :attribute_name, presence: true
  validates :attribue_value, presence: true
end
