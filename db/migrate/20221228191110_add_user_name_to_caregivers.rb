class AddUserNameToCaregivers < ActiveRecord::Migration[7.0]
  def change
    add_column :caregivers, :user_name, :string
  end
end
