class UserActivity < ApplicationRecord
  belongs_to :activity
  belongs_to :user
  belongs_to :comment
end
