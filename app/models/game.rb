class Game < ApplicationRecord
  belongs_to :company
  has_many :plays
end
