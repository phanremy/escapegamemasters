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
  validates_uniqueness_of :first_name, scope: :last_name

  def full_name
    [first_name, last_name].join(' ')
  end

  def full_name=(name)
    elements = name.split(' ')
    self.last_name = elements.delete(elements.last)
    self.first_name = elements.join(" ")
  end

  def self.search_by_fullname(query)
    User.where("CONCAT_WS(' ', first_name, last_name) = ?", "#{query}")
  end
end
