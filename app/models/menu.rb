class Menu < ApplicationRecord

  has_many :reservations, dependent: :destroy
  has_many :facilities_menus, dependent: :destroy
  has_many :facilities, through: :facilities_menus

  validates :date, presence: true
  validates :school_lunch, presence: true
  validates :ingredient, presence: true

end
