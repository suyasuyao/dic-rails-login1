class Blog < ApplicationRecord
  belongs_to :user
  validates :title, length: { minimum: 1, maximum: 75 }
  validates :content, length: { minimum: 1, maximum: 300 }
end
