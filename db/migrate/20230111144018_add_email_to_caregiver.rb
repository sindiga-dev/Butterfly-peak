class AddEmailToCaregiver < ActiveRecord::Migration[7.0]
  def change
    add_column :caregivers, :email, :string
    add_column :caregivers, :username, :string
  end
end
