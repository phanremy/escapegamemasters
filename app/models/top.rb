class Top < ApplicationRecord
  belongs_to :user
  belongs_to :one, class_name: 'Game', optional: true
  belongs_to :two, class_name: 'Game', optional: true
  belongs_to :three, class_name: 'Game', optional: true
  belongs_to :four, class_name: 'Game', optional: true
  belongs_to :five, class_name: 'Game', optional: true

  validates :user, presence: true, uniqueness: true
end
