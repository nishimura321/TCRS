# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者作成
Admin.find_or_create_by!(email: "admin@example.com") do |admin|
  admin.email = "admin@example.com"
  admin.password = ENV['ADMIN_PASSWORD']
end

#施設作成
Facility.find_or_create_by!(name: "あおぞらこども園") do |facility|
  facility.name = "あおぞらこども園"
  facility.name_kana = "アオゾラコドモエン"
  facility.email = "aozora@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町0-0-0"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.aozorakodomoen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "子どもたちが明るくのびのび生活できるよう、１人１人のペースに合わせた教育及び保育に取り組んでいます。"
end

Facility.find_or_create_by!(name: "ニコニコこども園") do |facility|
  facility.name = "ニコニコこども園"
  facility.name_kana = "ニコニココドモエン"
  facility.email = "nikoniko@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町1-1-1"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.nikonikokodomoen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "子どもたちが笑顔いっぱい元気に遊べるこども園になるよう努めています。"
end

Facility.find_or_create_by!(name: "おひさま保育園") do |facility|
  facility.name = "おひさま保育園"
  facility.name_kana = "オヒサマホイクエン"
  facility.email = "ohisama@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町2-2-2"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.ohisamahoikuen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "子ども一人ひとりを大切にし、保護者からも信頼され地域に愛される保育園をめざします。"
end

Facility.find_or_create_by!(name: "ひよここども園") do |facility|
  facility.name = "ひよここども園"
  facility.name_kana = "ヒヨココドモエン"
  facility.email = "hiyoko@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町3-3-3"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.hiyokokodomoen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "未来に向かって、たくましく生きる力と豊かな人間性の育成を目指して、モンテッソーリ教育の導入や異年齢交流教育を推進し、一人一人を丁寧に育てる教育を実践しています。"
end

Facility.find_or_create_by!(name: "なかよし保育園") do |facility|
  facility.name = "なかよし保育園"
  facility.name_kana = "ナカヨシホイクエン"
  facility.email = "nakayoshi@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町4-4-4"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.nakayoshihoikuen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "友達との関わりの中で、相手を大切にする心・思いやり・信頼感を育てるとともに協調性を養い、 将来一人の人間として自立できる基礎を養うことを目指しています。"
end

Facility.find_or_create_by!(name: "スマイル保育園") do |facility|
  facility.name = "スマイル保育園"
  facility.name_kana = "スマイルホイクエン"
  facility.email = "smile@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町5-5-5"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.smilehoikuen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "様々な遊びや体験を通して豊な感性を育て、創造力の芽生え・自発性・意欲を養うことを目指します。"
end

Facility.find_or_create_by!(name: "ふたばこども園") do |facility|
  facility.name = "ふたばこども園"
  facility.name_kana = "フタバコドモエン"
  facility.email = "futaba@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町6-6-6"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.futabakodomoen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "穏やかで温かいアットホームな環境の中で、子ども達が伸び伸びと活動し、欲求を満たすことで生命の保持と情緒の安定を図ることを目指しています。"
end

Facility.find_or_create_by!(name: "ひかりこども園") do |facility|
  facility.name = "ひかりこども園"
  facility.name_kana = "ヒカリコドモエン"
  facility.email = "hikari@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町7-7-7"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.hikarikodomoen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "子どもたち、保護者の皆様に寄り添い、安心・安全な保育を提供し、地域に根差した笑顔あふれるこども園づくりを目指しています。"
end

Facility.find_or_create_by!(name: "にじいろ保育園") do |facility|
  facility.name = "にじいろ保育園"
  facility.name_kana = "ニジイロホイクエン"
  facility.email = "niziiro@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町8-8-8"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.niziirohoikuen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "子ども一人一人の気持ちに寄り添った丁寧な保育を心掛け、保護者様と共に豊かな子育てができることを目指します。"
end

Facility.find_or_create_by!(name: "こぐまこども園") do |facility|
  facility.name = "こぐまこども園"
  facility.name_kana = "コグマコドモエン"
  facility.email = "koguma@example.com"
  facility.password = ENV['FACILITY_PASSWORD']
  facility.postal_code = "0000000"
  facility.address = "日本県日本市サンプル町9-9-9"
  facility.telephone_number = "0000000000"
  facility.website = "http://www.kogumakodomoen.co.jp"
  facility.business_day = "月曜日 ～ 土曜日"
  facility.business_hours = "07:00 ～ 19:00"
  facility.inquiry_hours = "08:30 ～ 18:00"
  facility.closed_day = "日曜日、祝日、年末年始"
  facility.childcare_hours = "平日 8:30 ～ 16:30"
  facility.target_age = "産休明けから小学校就学前"
  facility.school_meal = "給食・おやつあり"
  facility.fee = "1日利用料1,750円＋給食おやつ代250円＝2,000円"
  facility.message = "人としての土台づくりとなる大切な時期に、子どもたちがさまざまな人・物・自然と出会い、その中で豊かな体験をすることを通して、生きていく力を育んでいけるように努めてまいります。"
end

#施設ごとの献立作成
facilities = (1..10).map { |id| Facility.find_by(id: id) }.compact
dates = (Date.new(2024, 3, 1)..Date.new(2024, 7, 31)).select { |date| (1..5).include?(date.wday) }

dates.each do |date|
  next if HolidayJapan.check(date)

  facilities.each do |facility|

    Menu.find_or_create_by!(date: date) do |menu|
      menu.date = date

      # 日によって変わる内容を条件分岐で指定
      case date.wday
      when 1 # 月曜日
        menu.school_lunch = "ごはん、じゃがいもの味噌汁、豚の生姜焼き、ほうれん草のしらす和え、バナナ"
        menu.snack = "牛乳 、ツナコーン蒸しパン"
        menu.ingredient = "米、じゃがいも、しめじ、玉ねぎ、出汁、味噌、豚肉、片栗粉、ピーマン、にんじん、生姜、三温糖、醤油　ほうれん草、しらす、バナナ、ツナ缶、コーン、小麦粉、強力粉、牛乳"
      when 2 # 火曜日
        menu.school_lunch = "ごはん、春雨スープ、ホイコーロー、もやしのナムル、バナナ"
        menu.snack = "牛乳、きなこトースト"
        menu.ingredient = "米、コーン、玉ねぎ、春雨、豚肉、ピーマン、キャベツ、にんじん、にんにく、しょうが、甜麺醤、味噌、三温糖、ごま油、もやし、小松菜、わかめ、バナナ、牛乳、パン、きなこ、三温糖"
      when 3 # 水曜日
        menu.school_lunch = "食パン、千切りスープ、鶏のオニオン焼き、アスパラとじゃがいものソテー、みかん"
        menu.snack = "麦茶、じゃこごはん"
        menu.ingredient = "食パン、キャベツ、鶏肉、玉ねぎ、三温糖、醤油、豚肉、バター、じゃがいも、アスパラ、ピーマン、にんじん、みかん、麦茶、米、じゃこ"
      when 4 # 木曜日
        menu.school_lunch = "カレーライス、チンゲン菜のスープ、クルトンサラダ、りんごコンポート"
        menu.snack = "牛乳、りんごケーキ"
        menu.ingredient = "米、豚肉、油、玉ねぎ、にんじん、じゃがいも、小麦粉、ルウ、チンゲン菜、えのき、出汁、キャベツ、パプリカ、きゅうり、クルトン、オリーブ油、牛乳、三温糖、りんご　小麦粉、りんご、三温糖"
      when 5 # 金曜日
        menu.school_lunch = "ミートソーススパゲティ、大根のスープ、きつねサラダ、バナナ"
        menu.snack = "麦茶、チヂミ"
        menu.ingredient = "スパゲティ、玉ねぎ、にんじん、ピーマン、マッシュルーム、トマト缶、豚肉、鶏肉、大根、出汁、キャベツ、コーン、きゅうり、ひじき、油揚げ、胡麻油、バナナ、ニラ、にんじん、玉ねぎ、小麦粉"
      end

      menu.facilities << facility
    end
  end
end