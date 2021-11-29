class Sport < ApplicationRecord
  has_many :activities
  has_many :preferences
  belongs_to :category
  has_one_attached :photo
end
