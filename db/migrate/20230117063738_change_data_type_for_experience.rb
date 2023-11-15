class ChangeDataTypeForExperience < ActiveRecord::Migration[7.0]
  def change
    change_column(:caregivers, :experience, :string)
  end
end
