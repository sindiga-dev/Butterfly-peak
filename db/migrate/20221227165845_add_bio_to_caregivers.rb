class AddBioToCaregivers < ActiveRecord::Migration[7.0]
  def change
    add_column :caregivers, :bio, :text
  end
end
