class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :preferences
  has_many :activities
  has_many :comments, through: :user_activity
  has_many :user_activities

  validates :nickname, presence: true
end
