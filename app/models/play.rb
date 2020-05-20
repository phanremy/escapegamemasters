class Play < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many_attached :photos
end
