class Lesson < ApplicationRecord
  belongs_to :language
  has_many :users, through::UserLessons, dependent: :destroy
  has_many :userlessons

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :language, presence: true
end
