class RemovePlayersToPlays < ActiveRecord::Migration[5.2]
  def change
    remove_column :plays, :players, :text, array: true
  end
end
