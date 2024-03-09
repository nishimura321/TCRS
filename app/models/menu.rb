class Menu < ApplicationRecord

  has_many :reservations, dependent: :destroy
  has_many :facilities_menus, dependent: :destroy
  has_many :facilities, through: :facilities_menus

  validates :date, presence: true
  validates :school_lunch, presence: true
  validates :ingredient, presence: true

  #登録済みの献立日は登録できないようにするバリデーション
  validate :check_date, on: :create
  def check_date
    if Menu.exists?(date: self.date)
      errors.add(:date, "入力された献立日はすでに登録されています")
    end
  end

end
