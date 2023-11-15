class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :parent_id
      t.integer :caregiver_id
      t.text :comment

      t.timestamps
    end
  end
end
