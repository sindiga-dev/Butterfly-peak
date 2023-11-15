class AddColumnToParent < ActiveRecord::Migration[7.0]
  def change
    add_column :parents, :username, :string
    add_column :parents, :password_digest, :string
  end
end
