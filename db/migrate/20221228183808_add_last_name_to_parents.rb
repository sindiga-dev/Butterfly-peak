class AddLastNameToParents < ActiveRecord::Migration[7.0]
  def change
    add_column :parents, :last_name, :string
  end
end
