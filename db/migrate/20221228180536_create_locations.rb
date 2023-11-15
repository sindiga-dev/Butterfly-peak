class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.integer :parent_id
      t.integer :caregiver_id
      t.string :city
      t.string :town
      t.string :street_address
      t.string :province
      t.string :postal_zipcode

      t.timestamps
    end
  end
end
