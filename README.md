# Name
Customize Attributes

## Description
This is an implementation of dynamic customizable attributes which can be reused in multiple models without having to create new fields or JSON fields. I have implemented a concern that is included in the desired model and the behaviour(custom attributes for the model) automatically becomes present in a model included.

## Setup
The app is just a simple rails application therefore it does not require any extra setup. The general setup steps are:
 - clone the application
 - Run `bundle install` to install any missing gems
 - Run `rake db:create` to create the database
- Run `rake db:migrate` to migrate the database

## Architecture
The app consists of just three models, i.e: customer, battery and custom attribute(stored customized attributes for the different models) , and a concern: Customizable

## Impelentation
CustomAttribute Model:
 - The model is used to store the custom attributes for any model. This is ensured by having a polymorphic relationship to concerned models.

Customizable Concern:
 - The concern is included in models that wish to have the custom attributes behavior. The concern defined the relation between the included model ie Customer, Battery and the custom attributes.

Testing:
 - I have included tests to ensure that the custom attributes solution works as expected. Test cases include for setting, getting custom attributes and modifying custom attributes

## How it works
The general steps include:
 - Include the Customizable concern in a model you want to add the attribute customizable behaviour.
 - You should now manage to access custom attributes for a given instance. For example:
     ```
      customer = Customer.create(name: 'John')

      # Set custom attributes.
      customer.set_custom_attributes("location", "Nairobi")
      customer.set_custom_attributes("post_code", "01100")

      # Get custom attributes.
      customer.get_custom_attribute("location")
      customer.get_custom_attribute("post_code")
     ```

## Testing:
A test suite is included to ensure that the solution works as expected

## Contributions and License:
  Contributions to this open-source project are welcome. Feel free to open issues or submit pull requests.