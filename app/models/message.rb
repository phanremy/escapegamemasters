class Message < ApplicationRecord
  belongs_to :user
  belongs_to :play
  validates :content, presence: true
end
