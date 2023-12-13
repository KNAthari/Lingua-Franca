class Lesson < ApplicationRecord
  belongs_to :language
  has_many :user_lessons
  has_many :users, through: :user_lessons, dependent: :destroy


  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :language, presence: true
end
