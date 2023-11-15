class AddHourlyRateToCaregivers < ActiveRecord::Migration[7.0]
  def change
    add_column :caregivers, :hourly_rate, :decimal
  end
end
