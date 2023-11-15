class RemoveAddressFromCaregivers < ActiveRecord::Migration[7.0]
  def change
    remove_column :caregivers, :address, :string
  end
end
