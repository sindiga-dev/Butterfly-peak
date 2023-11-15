class AddFirstNameToCaregivers < ActiveRecord::Migration[7.0]
  def change
    add_column :caregivers, :first_name, :string
  end
end
