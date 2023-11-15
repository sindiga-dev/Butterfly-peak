class CreateParentAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :parent_addresses do |t|
      t.integer :parent_id
      t.string :city
      t.string :town
      t.string :street
      t.string :address
      t.string :province
      t.string :postal
      t.string :zipcode

      t.timestamps
    end
  end
end
