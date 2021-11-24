class UserActivity < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  has_many :comments
end
