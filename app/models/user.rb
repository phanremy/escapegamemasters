class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :messages, dependent: :destroy
  has_many :plays, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :partner_friends, class_name: "Friend", foreign_key: 'partner_id'
end
