class Board < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true

  has_many :posts, dependent: :destroy
  has_many :board_masters
  has_many :users, through: :board_masters

  has_many :favorite_boards 
  has_many :favorited_users, through: :favorite_boards, source: :user

  def favorited_by?(user)
    favorited_users.include?(user)
  end
end
