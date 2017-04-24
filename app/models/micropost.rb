class Micropost < ApplicationRecord
  belongs_to :user
  
  
  validates :id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
