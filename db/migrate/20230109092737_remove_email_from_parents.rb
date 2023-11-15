class RemoveEmailFromParents < ActiveRecord::Migration[7.0]
  def change
    remove_column :parents, :email, :string
  end
end
