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
    role_id == 1
  end

  def teacher?
    role_id == 2
  end

  def admin?
    role_id == 3
  end


end
