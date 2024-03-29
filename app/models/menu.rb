class Menu < ApplicationRecord

  has_many :reservations, dependent: :destroy
  has_many :facilities_menus, dependent: :destroy
  has_many :facilities, through: :facilities_menus

  validates :date, presence: true
  validates :school_lunch, presence: true
  validates :ingredient, presence: true

  #検索方法
  def self.looks(search, word)
    search = "perfect_match"
    @menu = Menu.where("date LIKE?", "#{word}")
  end
  
end
