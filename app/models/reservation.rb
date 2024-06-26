class Reservation < ApplicationRecord

  scope :validation_checked, -> { where(is_valid_reservation: true) }
  include HolidayConcern

  belongs_to :customer
  belongs_to :child
  belongs_to :family, optional: true
  belongs_to :facility
  belongs_to :menu, optional: true

  enum purpose_of_use: { atypical: 0, emergency: 1, private_business: 2}

  validates :day, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :wants_meal_service, inclusion: { in: [true, false] }
  validates :purpose_of_use, presence: true
  validates :main_pick_up_person, presence: true
  validates :emergency_contact_1, presence: true

  # 予約データから指定された日付・時間の予約が2件以上あるかチェックするメソッド
  def self.full_reserved?(day, time)
    target_start_time = Time.zone.parse("#{day} #{time}:00")
    target_end_time = target_start_time.since(30.minutes)
    reservation_count = self.where(start_time: (..target_start_time), end_time: (target_end_time..)).size
    if reservation_count >= 2
      true
    else
      false
    end
  end

  # 過去の日付を選択しないようにするバリデーション
  validate :date_before_start
  def date_before_start
    if day.present?
      errors.add(:day, "過去の日付は選択できません。") if day < Date.current
    end
  end

  # 当日が選択できないようにするバリデーション
  validate :date_current_today
  def date_current_today
    if day.present? && day == Date.current
      errors.add(:day, "当日は選択できません。予約画面から正しい日付を選択してください。")
    end
  end

  # 再来月以降の日付が選択できないようにするバリデーション
  validate :date_tow_month_end
  def date_tow_month_end
    if day.present?
      next_month_end = Date.current.end_of_month.next_month
      errors.add(:day, "再来月以降の日付は選択できません。") if day > next_month_end
    end
  end

  # 土日は選択できないようにするバリデーション
  validate :no_weekend
  def no_weekend
    errors.add(:day, "土日は選択できません。") if day.present? && (day.saturday? || day.sunday?)
  end

  # 祝日は選択できないようにするバリデーション
  validate :no_holiday
  def no_holiday
    errors.add(:day, "祝日は選択できません。") if day.present? && is_holiday?(day)
  end

  # 予約希望日の入力を確認するバリデーション(27行目だけでは不足するため追加)
  validate :validate_date
  def validate_date
    if day.nil? || day.year.blank? || day.month.blank? || day.day.blank?
      errors.add(:day, "年、月、日の入力が必要です。")
    end
  end

  # 予約時間のstart_timeとend_timeの逆転防止のバリデーション
  validate :start_end_check
  def start_end_check
    errors.add(:end_time, "予約終了時間は開始時間より早い時間は登録できません。") unless self.start_time < self.end_time
  end

  # 予約時間を8:30から16:30の間に指定するバリデーション
  validate :time_range
  def time_range
    if self.day.nil? || self.start_time.nil? || self.end_time.nil?
      errors.add(:base, "予約希望日時を正しく選択してください。")
      return
    end

    start_time = self.start_time
    end_time = self.end_time
    min_time = Time.zone.parse("#{self.day.year}/#{self.day.month}/#{self.day.day} 8:30")
    max_time = Time.zone.parse("#{self.day.year}/#{self.day.month}/#{self.day.day} 16:30")

    if start_time < min_time || end_time > max_time
      errors.add(:start_time, "予約時間は8:30から16:30の間で選択してください。")
    end
  end

  # カレンダーの×の日が選択できないようにするバリデーション
  validate :validate_reservation_availability, on: :create
  def validate_reservation_availability
    if self.day.nil? || self.start_time.nil? || self.end_time.nil?
      errors.add(:base, "予約希望日時を正しく選択してください。")
      return
    end

    reservation_count = 0
    facility.reservations.validation_checked.where(day: day).each do |reservation|
      range = (reservation.start_time...reservation.end_time)
      if range.cover?(start_time) && start_time != reservation.end_time
          reservation_count += 1
      elsif range.cover?(end_time) && end_time != reservation.start_time
        reservation_count += 1
      end
    end

    if reservation_count >= 2
      errors.add(:base, 'この日時はすでに予約がいっぱいです。')
      return
    end
  end

  # 検索方法
  def self.search_for(word, search, facility)
    if facility.present?
      if search == 'perfect_match'
        facility.reservations.where(['id LIKE(?) OR day LIKE(?)', word, word])
      elsif search == 'forward_match'
        facility.reservations.where(['id LIKE(?) OR day LIKE(?)', word + '%', word + '%'])
      elsif search == 'backward_match'
        facility.reservations.where(['id LIKE(?) OR day LIKE(?)', '%' + word, '%' + word])
      # 以下は部分一致
      else
        facility.reservations.where(['id LIKE(?) OR day LIKE(?)', '%' + word + '%', '%' + word + '%'])
      end
    end
  end

end
