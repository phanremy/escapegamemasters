class Play < ApplicationRecord
  belongs_to :game
  belongs_to :user
  validates :date, presence: true
  has_many :participations, dependent: :destroy
  has_many_attached :photos
end
