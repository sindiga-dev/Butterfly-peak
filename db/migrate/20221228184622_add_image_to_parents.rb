class AddImageToParents < ActiveRecord::Migration[7.0]
  def change
    add_column :parents, :image, :string
  end
end
