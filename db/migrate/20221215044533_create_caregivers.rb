class CreateCaregivers < ActiveRecord::Migration[7.0]
  def change
    create_table :caregivers do |t|
      t.string :avatar
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :gender
      t.integer :phone
      t.string :education
      t.integer :experience
      t.boolean :is_booked
      t.integer :age

      t.timestamps
    end
  end
end
