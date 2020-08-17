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

  include AASM

  aasm(column: 'state') do
    # default column: aasm_state
    state :normal, initial: true
    state :hidden, :locked

    event :hide do
      transitions from: %i[normal locked], to: :hidden
    end

    event :show do
      transitions from: :hidden, to: :locked
    end

    event :lock do
      transitions from: %i[normal hidden], to: :locked

      after_transaction { puts '已鎖版！' }
    end

    event :unlock do
      transitions from: :locked, to: :normal
    end
  end
end
