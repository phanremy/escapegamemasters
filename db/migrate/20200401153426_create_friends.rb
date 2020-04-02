class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: true
      t.references :partner
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
