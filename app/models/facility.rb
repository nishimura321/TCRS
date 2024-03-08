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

#予約データから指定された日付・時間の予約が2件以上あるかチェックするメソッド
  def self.full_reserved?(day, time)
    target_start_time = Time.zone.parse("#{day} #{time}:00")
    target_end_time = target_start_time.since(30.minutes)
    reservation_count = Reservation.where(start_time: (..target_start_time), end_time: (target_end_time..)).size
    if reservation_count >= 2
      true
    else
      false
    end
  end

end
