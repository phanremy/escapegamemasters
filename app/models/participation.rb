class Participation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :play
end