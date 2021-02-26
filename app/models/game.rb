class Game < ApplicationRecord
  has_many :game_developers
  has_many :developers, through: :game_developers
end
