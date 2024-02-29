class Facility < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  has_many :facilities_menus, dependent: :destroy
  has_many :menus, through: :facilities_menus

  validates :name, presence: true
  validates :name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :website, presence: true
  validates :business_day, presence: true
  validates :business_hours, presence: true
  validates :inquiry_hours, presence: true
  validates :closed_day, presence: true
  validates :childcare_hours, presence: true
  validates :target_age, presence: true
  validates :school_meal, presence: true
  validates :fee, presence: true
  validates :message, presence: true

end
