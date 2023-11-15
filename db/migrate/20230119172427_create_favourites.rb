class CreateFavourites < ActiveRecord::Migration[7.0]
  def change
    create_table :favourites do |t|
      t.string :name
      t.string :nanny_url
      t.string :nannyLocation
      t.integer :rating
      t.string :nannyPrice

      t.timestamps
    end
  end
end
