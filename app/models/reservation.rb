class Reservation < ApplicationRecord
  include HolidayConcern

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

  validates :day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :wants_meal_service, inclusion: { in: [true, false] }
  validates :purpose_of_use, presence: true
  validates :main_pick_up_person, presence: true
  validates :emergency_contact_1, presence: true

  #過去の日付を選択しないようにするバリデーション
  validate :date_before_start
  def date_before_start
    if day.present?
      errors.add(:day, "過去の日付は選択できません。") if day < Date.current
    end
  end

  #当日が選択できないようにするバリデーション
  validate :date_current_today
  def date_current_today
    if day.present?
      errors.add(:day, "当日は選択できません。予約画面から正しい日付を選択してください。") if day < (Date.current + 1)
    end
  end

  #再来月以降の日付が選択できないようにするバリデーション
  validate :date_tow_month_end
  def date_tow_month_end
    if day.present?
      next_month_end = Date.current.end_of_month.next_month
      errors.add(:day, "再来月以降の日付は選択できません。") if day > next_month_end
    end
  end

  #土日は選択できないようにするバリデーション
  validate :no_weekend
  def no_weekend
    errors.add(:day, "土日は選択できません。") if day.present? && (day.saturday? || day.sunday?)
  end

  #祝日は選択できないようにするバリデーション
  validate :no_holiday
  def no_holiday
    errors.add(:day, "祝日は選択できません。") if day.present? && is_holiday?(day)
  end

  #予約希望日の入力を確認するバリデーション(27行目だけでは不足するため追加)
  validate :validate_date
  def validate_date
    if day.nil? || day.year.blank? || day.month.blank? || day.day.blank?
      errors.add(:day, "年、月、日の入力が必要です")
    end
  end

  #予約希望時間の入力を確認するバリデーション(28,29行目だけでは不足するため追加)
  validate :validate_time
  def validate_time
    if start_time.nil? || start_time.hour.blank? || start_time.min.blank? ||
       end_time.nil? || end_time.hour.blank? || end_time.min.blank?
      errors.add(:start_time, "開始時間と終了時間の入力が必要です")
    end
  end

  #予約時間のstart_timeとend_timeの逆転防止のバリデーション
  validate :start_end_check
  def start_end_check
    errors.add(:end_time, "予約終了時間は開始時間より早い時間は登録できません。") unless self.start_time < self.end_time
  end

  #予約時間を8:30から16:30の間に指定するバリデーション
  validate :time_range
  def time_range
    if self.day.nil? || self.start_time.nil? || self.end_time.nil?
      errors.add(:base, "予約希望日時を正しく選択してください")
      return
    end

    start_time = self.start_time
    end_time = self.end_time
    min_time = Time.new(self.day.year, self.day.month, self.day.day, 8, 30)
    max_time = Time.new(self.day.year, self.day.month, self.day.day, 16, 30)
    if start_time < min_time || end_time > max_time
      errors.add(:start_time, "予約時間は8:30から16:30の間で選択してください。")
    end
  end

  validate :check_reservation_count
  def check_reservation_count
    if self.day.nil?
      errors.add(:base, "予約希望日時を正しく選択してください")
      return
    end

    count = 0
    Reservation.all.each do |reservation|
      start_time = reservation[:start_time].strftime("%H:%M")
      end_time = reservation[:end_time].strftime("%H:%M")
      if reservation[:day] == day.strftime("%Y-%m-%d") && start_time <= self.start_time.strftime("%H:%M") && self.start_time.strftime("%H:%M") <= end_time && reservation[:facility_id] == facility_id
        count += 1
      end
    end

    if count > 1
      errors.add(:day, "この日付は予約がいっぱいです。")
    end
  end

end
