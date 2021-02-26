class Platform < ApplicationRecord
  has_many :game_platforms
  has_many :game, through: :game_platforms
  validates :name, uniqueness: true
  validates :name, presence: true
end