class Comment < ApplicationRecord
  belongs_to :user_activity

  validates :content, length: { minimum: 1 }
end
