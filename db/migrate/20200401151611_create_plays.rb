class CreatePlays < ActiveRecord::Migration[5.2]
  def change
    create_table :plays do |t|
      t.boolean :done
      t.boolean :won
      t.date :date
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.text :players, array: true, default: []

      t.timestamps
    end
  end
end
