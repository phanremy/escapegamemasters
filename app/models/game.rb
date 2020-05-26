class Game < ApplicationRecord
  belongs_to :company
  has_many :plays, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
end
