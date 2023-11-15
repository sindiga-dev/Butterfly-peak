class AddEmailToParent < ActiveRecord::Migration[7.0]
  def change
    add_column :parents, :email, :string
  end
end
