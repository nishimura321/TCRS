module Customer::ReservationsHelper

  #予約時間帯を表示させる
  def times
    times = ["8:30",
             "9:00",
             "9:30",
             "10:00",
             "10:30",
             "11:00",
             "11:30",
             "13:00",
             "13:30",
             "14:00",
             "15:00",
             "15:30",
             "16:00",
             "16:30"]
  end

  #予約データから指定された施設・日付・時間の予約が2件以上あるかどうかをチェックするメソッド
  def check_reservation(reservations, day, time, facility_id)
    count = 0
    result = false
    reservations.each do |reservation|
      start_time = reservation[:start_time].strftime("%H:%M")
      end_time = reservation[:end_time].strftime("%H:%M")
      if reservation[:day] == day.strftime("%Y-%m-%d") && time.between?(start_time, end_time) && reservation[:facility_id] == facility_id
        count += 1
      end
    end

    if count > 1
      result = true
    end

    result
  end

end
