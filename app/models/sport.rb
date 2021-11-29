class Sport < ApplicationRecord
  has_many :activities
  has_many :preferences
  has_many :users, through: :preferences
  belongs_to :category
  has_one_attached :photo
end
