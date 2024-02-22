class Menu < ApplicationRecord

  has_many :reservations, dependent: :destroy

  validates :date, presence: true
  validates :school_lunch, presence: true
  validates :ingredient, presence: true

end
