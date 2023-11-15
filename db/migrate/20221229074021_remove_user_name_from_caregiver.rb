class RemoveUserNameFromCaregiver < ActiveRecord::Migration[7.0]
  def change
    remove_column :caregivers, :user_name, :string
  end
end
