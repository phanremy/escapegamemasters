class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.references :company, foreign_key: true
      t.integer :rating
      t.string :price

      t.timestamps
    end
  end
end
