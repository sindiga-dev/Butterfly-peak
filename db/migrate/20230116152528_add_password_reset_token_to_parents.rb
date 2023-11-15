class AddPasswordResetTokenToParents < ActiveRecord::Migration[7.0]
  def change
    add_column :parents, :password_reset_token, :string
  end
end
