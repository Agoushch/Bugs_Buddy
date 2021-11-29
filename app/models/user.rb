class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :preferences
  has_many :activities, dependent: :destroy
  has_many :comments, through: :user_activity
  has_many :sports, through: :preferences
  has_many :user_activities
  has_one_attached :photo
end
