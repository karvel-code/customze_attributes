module Customizable
  extend ActiveSupport::Concern

  included do
    has_many :custom_attributes, as: :customizable
  end
end