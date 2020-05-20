class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :location, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
