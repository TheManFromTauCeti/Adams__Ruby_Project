class Game < ApplicationRecord
  has_many :game_developers
  has_many :developers, through: :game_developers
  has_many :game_platforms
  has_many :platforms, through: :game_platforms
  validates :name, uniqueness: true
  validates :name, presence: true
end
