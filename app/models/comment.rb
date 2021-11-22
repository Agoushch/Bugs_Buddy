class Comment < ApplicationRecord
  belongs_to :activity, through: :user_activity
  belongs_to :user, through: :user_activity

  validates :content, length: { minimum: 1 }
end
