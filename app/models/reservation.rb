class Reservation < ApplicationRecord

  belongs_to :customer
  belongs_to :child
  belongs_to :facilities
  belongs_to :menus
  has_many :families_reservations, dependent: :destroy

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
