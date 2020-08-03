class Board < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true

  has_many :posts, dependent: :destroy
  has_many :board_masters
  has_many :users, through: :board_masters
end
