module Customizable
  extend ActiveSupport::Concern

  included do
    has_many :custom_attributes, as: :customizable
  end

  def set_custom_attributes(name, value)
    attribute = custom_attributes.find_or_initialize_by(attribute_name: name)
    attribute.attribue_value = value
    attribute.save
  end

  def get_custom_attribute(name)
    custom_attributes.find_by(attribute_name: name)
  end

  def custom_attributes
    custom_attributes.each_with_object({}) do |attr, hash|
      hash[attr.key] = attr.value
    end
  end

end