class Game < ApplicationRecord
  belongs_to :company
  has_many :plays
  has_many_attached :photos

  validates :name, presence: true
end
