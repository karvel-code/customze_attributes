class CreateCustomAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_attributes do |t|
      t.string :attribute_name, null: false
      t.string :attribute_value, null: false
      t.references :customizable, polymorphic: true

      t.timestamps
    end
  end
end
