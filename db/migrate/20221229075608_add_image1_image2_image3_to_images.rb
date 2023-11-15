class AddImage1Image2Image3ToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :image1, :string
    add_column :images, :image2, :string
    add_column :images, :image3, :string
  end
end
