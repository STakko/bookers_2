class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  attachment :profile_image

  validates :name, length: {in: 2..20}
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :introduction, length: {maximum: 50}

  
end
