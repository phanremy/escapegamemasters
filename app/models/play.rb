class Play < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
end
