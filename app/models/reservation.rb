class Reservation < ApplicationRecord

  validates :day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :wants_meal_service, inclusion: { in: [true, false] }
  validates :purpose_of_use, presence: true
  validates :main_pick_up_person, presence: true
  validates :emergency_contact_1, presence: true

  validate :date_before_start #過去の日付を選択しないようにするバリデーション
  validate :date_current_today #当日が選択できないようにするバリデーション
  validate :date_tow_month_end #再来月以降の日付が選択できないようにするバリデーション
  validate :start_end_check #予約時間のstart_timeとend_timeの逆転防止のバリデーション
  validate :time_range #予約時間を8:30から16:30の間に指定するバリデーション

  def date_before_start
    if day.present?
      errors.add(:day, "(予約日)は過去の日付は選択できません。") if day < Date.current
    end
  end

  def date_current_today
    if day.present?
      errors.add(:day, "(予約日)は当日は選択できません。予約画面から正しい日付を選択してください。") if day < (Date.current + 1)
    end
  end

  def date_tow_month_end
    if day.present?
      next_month_end = Date.current.end_of_month.next_month
      errors.add(:day, "(予約日)は再来月以降の日付は選択できません。") if day > next_month_end
    end
  end

  def start_end_check
    errors.add(:end_time, "(予約終了時間)は開始時間より早い時間は登録できません。") unless self.start_time < self.end_time
  end

  def time_range
    start_time = self.start_time
    end_time = self.end_time
    min_time = Time.new(1, 1, 1, 8, 30)
    max_time = Time.new(1, 1, 1, 16, 30)
    if start_time.present? && end_time.present? && (start_time < min_time || end_time > max_time)
      errors.add(:start_time, "(予約時間)は8:30から16:30の間で選択してください。")
    end
  end

  belongs_to :customer
  belongs_to :child
  belongs_to :family, optional: true
  belongs_to :facility
  belongs_to :menu, optional: true

  enum purpose_of_use: { atypical: 0, emergency: 1, private_business: 2}

  #当月末と来月末までの予約を取得するメソッド
  def self.reservations_for_two_months(facility_id)
    start_date = Date.current
    end_date = start_date.next_month.end_of_month
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
