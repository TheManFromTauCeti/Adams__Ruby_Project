class CreateGameDevelopers < ActiveRecord::Migration[6.1]
  def change
    create_table :game_developers do |t|
      t.references :game, null: false, foreign_key: true
      t.references :developer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
