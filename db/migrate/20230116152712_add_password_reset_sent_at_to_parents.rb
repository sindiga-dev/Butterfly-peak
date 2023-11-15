class AddPasswordResetSentAtToParents < ActiveRecord::Migration[7.0]
  def change
    add_column :parents, :password_reset_sent_at, :datetime
  end
end
