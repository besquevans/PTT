class Board < ApplicationRecord
  validates :title, presence: true
  validates :intro, presence: true

  def destroy
    self.update(deleted_at: Time.now)
  end
end
