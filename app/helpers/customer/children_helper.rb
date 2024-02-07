module Customer::ChildrenHelper

#年齢を返すメソッド
def age_in_years(birthday)
  now = Time.now
  age = now.year - birthday.year
  age -= 1 if now.month < birthday.month || (now.month == birthday.month && now.day < birthday.day)
  age
end

#月齢を返すメソッド
def age_in_months(birthday)
  now = Time.now
  if now.month >= birthday.month
    age_in_months = now.month - birthday.month
  else
    age_in_months = (12 - birthday.month) + now.month
  end
  age_in_months -= 1 if now.day < birthday.day
  #以下は月齢がマイナスになる場合月齢を0にするための処理
  age_in_months = 0 if age_in_months < 0
  age_in_months
end

end
