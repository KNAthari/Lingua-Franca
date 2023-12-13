class User < ApplicationRecord
  has_many :lessons, through::UserLessons, dependent: :destroy
  has_many :userlessons
  belongs_to :role, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :user_name, :role, presence: true
end
