class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :user, foreign_key: true
      t.references :play, foreign_key: true
      t.string :optional_name
      t.timestamps
    end
  end
end
