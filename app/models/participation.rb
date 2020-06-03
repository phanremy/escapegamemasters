class Participation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :play

  validate :user_xor_name

  private

  def user_xor_name
    errors.add(:base, "User or not? cannot be both") unless user.blank? ^ optional_name.blank?
  end
end
