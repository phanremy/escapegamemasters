class CreateTops < ActiveRecord::Migration[5.2]
  def change
    create_table :tops do |t|
      t.references :one
      t.text :one_comment
      t.references :two
      t.text :two_comment
      t.references :three
      t.text :three_comment
      t.references :four
      t.text :four_comment
      t.references :five
      t.text :five_comment

      t.timestamps
    end
  end
end
