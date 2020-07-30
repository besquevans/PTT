class Board < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true

  has_many :posts
end
