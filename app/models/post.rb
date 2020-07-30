class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :board

  validates :title, presence: true
end
