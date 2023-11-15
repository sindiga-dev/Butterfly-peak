class RemoveImageFromImages < ActiveRecord::Migration[7.0]
  def change
    remove_column :images, :image, :string
  end
end
