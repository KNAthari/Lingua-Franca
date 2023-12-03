class Lesson < ApplicationRecord
  belongs_to :users
  belongs_to :languages
end
