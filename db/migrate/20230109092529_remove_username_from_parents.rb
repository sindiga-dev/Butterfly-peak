class RemoveUsernameFromParents < ActiveRecord::Migration[7.0]
  def change
    remove_column :parents, :username, :string
  end
end
