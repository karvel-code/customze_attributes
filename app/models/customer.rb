class Customer < ApplicationRecord
  has_many :custom_attributes, as: :customizable
end
