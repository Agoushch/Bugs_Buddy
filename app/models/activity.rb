class Activity < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  has_many :comments, through: :user_activity
  has_many :user_activities

  validates :localisation, presence: true
  validates :date, presence: true
end
