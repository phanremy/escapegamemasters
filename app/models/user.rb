class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :plays
  has_many :friends
  has_many :partner_friends, class_name: "Friend", foreign_key: 'partner_id'
end
