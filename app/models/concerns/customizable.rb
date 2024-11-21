module Customizable
  extend ActiveSupport::Concern

  included do
    has_many :custom_attributes, as: :customizable
  end

  def set_custom_attributes(name, value)
    attribute = custom_attributes.find_or_initialize_by(attribute_name: name)
    attribute.attribute_value = value
    attribute.save
  end

  def get_custom_attribute(name)
    custom_attributes.find_by(attribute_name: name)&.attribute_value
  end

  def all_custom_attributes
    custom_attributes.each_with_object({}) do |attr, hash|
      hash[attr.attribute_name] = attr.attribute_value
    end
  end

  def delete_custom_attribute(name)
    attribute = custom_attributes.find_by(attribute_name: get_custom_attribute(name))
    attribute.destroy
  end

end
