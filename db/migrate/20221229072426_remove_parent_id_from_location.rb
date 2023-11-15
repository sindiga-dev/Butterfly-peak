class RemoveParentIdFromLocation < ActiveRecord::Migration[7.0]
  def change
    remove_column :locations, :parent_id, :integer
  end
end
