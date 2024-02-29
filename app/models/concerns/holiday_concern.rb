module HolidayConcern
  extend ActiveSupport::Concern

  #祝日判定のメソッド
  def is_holiday?(date)
    HolidayJapan.check(date)
  end
end