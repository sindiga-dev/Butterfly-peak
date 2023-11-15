class RemoveEmailFromCaregivers < ActiveRecord::Migration[7.0]
  def change
    remove_column :caregivers, :email, :string
  end
end
