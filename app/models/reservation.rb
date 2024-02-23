class Reservation < ApplicationRecord

  validates :day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :wants_meal_service, inclusion: { in: [true, false] }
  validates :purpose_of_use, presence: true

  #予約日の選択に関するバリデーション
  validate :date_before_start, on: :confirm
  validate :date_current_today, on: :confirm
  validate :date_tow_month_end, on: :confirm
  #予約時間のstart_timeとend_timeの逆転防止のバリデーション
  validate :start_end_check, on: :confirm
  #予約時間を8:30から16:30の間に指定するバリデーション
  validate :time_range, on: :confirm

  def date_before_start
    errors.add(:day, "は過去の日付は選択できません。") if day < Date.current
  end

  def date_current_today
    errors.add(:day, "は当日は選択できません。予約画面から正しい日付を選択してください。") if day < (Date.current + 1)
  end

  def date_tow_month_end
    next_month_end = Date.current.end_of_month.next_month
    errors.add(:day, "は再来月以降の日付は選択できません。") if day > next_month_end
  end

  def start_end_check
    errors.add(:end_time, "は開始時間より早い時間は登録できません。") unless self.start_time < self.end_time
  end

  def time_range
    start_time = self.start_time
    end_time = self.end_time
    min_time = Time.new(Time.current.year, Time.current.month, Time.current.day, 8, 30)
    max_time = Time.new(Time.current.year, Time.current.month, Time.current.day, 16, 30)

    if start_time.present? && end_time.present? && (start_time < min_time || end_time > max_time)
    errors.add(:start_time, "は8:30から16:30の間で選択してください。")
    end
  end

  belongs_to :customer
  belongs_to :child
  belongs_to :facility
  belongs_to :menu, optional: true
  has_many :families_reservations, dependent: :destroy
  has_many :families, through: :families_reservations

  enum purpose_of_use: { atypical: 0, emergency: 1, private_business: 2}

  #当月末と来月末までの予約を取得するメソッド
  def self.reservations_for_two_months(facility_id)
    start_date = Date.current
    end_date = start_date.end_of_month.next_month
    reservations = Reservation.where("day >= ? AND day <= ? AND facility_id = ?", start_date, end_date, facility_id).order(day: :desc)

    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), start_time: reservation.start_time, end_time: reservation.end_time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end

end
