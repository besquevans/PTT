class Post < ApplicationRecord
  acts_as_paranoid

  validates :title, presence: true
  validates :serial, uniqueness: true

  belongs_to :board
  belongs_to :user 
  has_many :comments
  has_one_attached :photo
  
  before_create :create_serial
  #只有新增資料時執行

  def display_username
    if user.nil? 
      "-"
    else
      user.account
    end
  end

  private 

  def create_serial
    self.serial = serial_generator(10)
  end

  def serial_generator(n)
    list = [*'A'..'Z', *'a'..'z', *0..9]
    list -= ['i','l','I',1,0,'o']
    list.sample(n).join
  end
end
