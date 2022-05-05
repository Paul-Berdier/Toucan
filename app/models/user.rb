class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :toucs, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followers, foreign_key: "followed_id", class_name: 'Relationship'
  has_many :following, foreign_key: "follower_id", class_name: 'Relationship'
  # has_many :followees, through: :followed_users
  # has_many :following_users, foreign_key: :followed_id, class_name: 'Relationship'
  # has_many :followers, through: :following_users
end
