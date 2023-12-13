class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role, dependent: :destroy
  has_many :user_lessons
  has_many :lessons, through: :user_lessons, dependent: :destroy

  validates :first_name, :last_name, :user_name, :role, presence: true

  def student?
    title == 'student'
  end

  def teacher?
    title == 'teacher'
  end

  def admin?
    title == 'admin'
  end


end
