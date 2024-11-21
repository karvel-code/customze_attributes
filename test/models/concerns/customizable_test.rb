# frozen_string_literal: true

require 'test_helper'

class CustomizableTest < ActiveSupport::TestCase

  def setup
    @customer = Customer.create(name: "John")
    @battery = Battery.create(capacity: 10)
  end

  test 'setting and getting custom attributes' do
    # Set custom attributes
    @customer.set_custom_attributes("location", "Nairobi")
    @customer.set_custom_attributes("post_code", "01100")

    # Get custom attributes
    assert_equal 'Nairobi', @customer.get_custom_attribute("location")
    assert_equal '01100', @customer.get_custom_attribute("post_code")
  end

  test 'should allow attribute modification' do
    # Allow attribute modification
    @customer.set_custom_attributes("location", "Mombasa")
  end

  test 'should return nil if attribute is not present' do
    # Should return nil if attribute is not present
    assert_equal nil, @customer.get_custom_attribute("age")
  end

  test 'works well with another/any model' do
    # Set custom attributes
    @battery.set_custom_attributes("size", "AA")
    @battery.set_custom_attributes("voltage", "20V")

    # Get custom attributes
    assert_equal 'AA', @battery.get_custom_attribute("size")
    assert_equal '20V', @battery.get_custom_attribute("voltage")
  end

end