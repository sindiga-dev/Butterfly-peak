class RemovePasswordDigestFromCaregivers < ActiveRecord::Migration[7.0]
  def change
    remove_column :caregivers, :password_digest, :string
  end
end
