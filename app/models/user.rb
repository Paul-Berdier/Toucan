class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :toucs
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followers, foreign_key: "followed_id", class_name: 'Relationship'
  has_many :following, foreign_key: "follower_id", class_name: 'Relationship'
end