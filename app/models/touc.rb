class Touc < ApplicationRecord
  belongs_to :user
  has_many :active_relationships
  has_many :likes, dependent: :destroy
end
