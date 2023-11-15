class AddPasswordDigestToCaregiver < ActiveRecord::Migration[7.0]
  def change
    add_column :caregivers, :password_digest, :string
  end
end
