module ApplicationHelper

  def japanese_day(date)
    case date.strftime('%a')
    when 'Mon'
      '（月）'
    when 'Tue'
      '（火）'
    when 'Wed'
      '（水）'
    when 'Thu'
      '（木）'
    when 'Fri'
      '（金）'
    when 'Sat'
      '（土）'
    when 'Sun'
      '（日）'
    else
      ''
    end
  end

end
