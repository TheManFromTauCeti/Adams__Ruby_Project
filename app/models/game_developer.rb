class GameDeveloper < ApplicationRecord
  belongs_to :game
  belongs_to :developer
end
