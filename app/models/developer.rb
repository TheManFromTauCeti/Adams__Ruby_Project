class Developer < ApplicationRecord
  has_many :game_developers
  has_many :games, through: :game_developers
  validates :name, uniqueness: true
  validates :name, presence: true
end
