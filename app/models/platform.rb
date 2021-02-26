class Platform < ApplicationRecord
  has_many :game_platforms
  has_many :game, through: :game_platforms
end
