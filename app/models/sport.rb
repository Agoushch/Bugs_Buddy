class Sport < ApplicationRecord
  has_many :activities
  has_many :preferences
end
