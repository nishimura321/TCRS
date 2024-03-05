module Customer::ReservationsHelper

  #予約時間帯を表示させる
  def times
    times = ["08:30",
             "09:00",
             "09:30",
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

  #取得した予約データから指定された日付・時間の予約が2件以上あるかどうかをチェックするメソッド
  def check_reservation(reservations, day, time)
    count = 0
    result = false
    reservations.each do |reservation|
      start_time = reservation[:start_time].strftime("%H:%M")
      end_time = reservation[:end_time].strftime("%H:%M")
      if reservation[:day] == day.strftime("%Y-%m-%d") && time.between?(start_time, end_time)
        count += 1
      end
    end

    if count >= 2
      result = true
    end

    result
  end

end
