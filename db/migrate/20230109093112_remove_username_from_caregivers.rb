class RemoveUsernameFromCaregivers < ActiveRecord::Migration[7.0]
  def change
    remove_column :caregivers, :username, :string
  end
end
