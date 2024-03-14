class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  has_many :children, dependent: :destroy
  has_many :families, dependent: :destroy
  has_many :reservations, dependent: :destroy

  #ゲストログイン用メソッド
  def self.guest
    customer = Customer.find_or_create_by!(last_name: 'guest_' ,first_name: 'user' ,email: 'guest_user@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "guest_"
      customer.first_name = "user"
      customer.last_name_kana = "ゲスト"
      customer.first_name_kana = "ユーザー"
      customer.email = 'guest_user@example.com'
      customer.postal_code = "0000000"
      customer.address = "日本県日本市ゲスト町0-00"
      customer.telephone_number = "00000000000"
    end

    child = customer.children.find_or_create_by!(last_name: 'guest_' ,first_name: 'child') do |child|
      child.last_name = 'guest_'
      child.first_name = 'child'
      child.last_name_kana = 'ゲスト'
      child.first_name_kana = 'チャイルド'
      child.birthday = Date.new(2022, 1, 1)
      child.male = true
      child.has_febrile_seizure = false
      child.has_dislocation = false
      child.has_allergy = false
      child.normal_body_temperature = 36.5
      child.fever = 37.5
      child.breastfeeding_status = 4
      child.milk_situation_after_baby_food = 2
      child.baby_food_progress = 4
      child.appetite = 1
      child.favorite_food = 'ハンバーグ、カレー、肉団子、さつまいも'
      child.hated_food = '生野菜'
      child.how_to_eat = 1
      child.meal_time = 30
      child.how_to_lay_it_down = 1
      child.falling_asleep = 2
      child.waking_up = 2
      child.sleeping_position = 1
      child.is_deep_sleep = true
      child.habits_when_sleeping = '指しゃぶりをしながら寝る'
      child.diaper_usage = 2
      child.is_sensitive_to_rash = false
      child.urination = 3
      child.defecation = 1
      child.number_of_defecation = '一日1回'
      child.favorite_game = '砂場遊び、ブランコ、水遊び、お医者さんごっこ'
      child.favorite_toy = '絵本、ブロック、お医者さんのおもちゃ'
      child.hospital_name = 'ゲスト小児科'
      child.hospital_telephone_number = '0000000000'
      child.memo = '人見知りがあります。'
    end

    family = customer.families.find_or_create_by!(last_name: 'guest_' ,first_name: 'user') do |family|
      family.last_name = 'guest_'
      family.first_name = 'user'
      family.last_name_kana = 'ゲスト'
      family.first_name_kana = 'ユーザー'
      family.male = false
      family.relationship = 0
      family.birthday = Date.new(1990, 1, 1)
      family.telephone_number = '00000000000'
    end

    #{ customer: customer, family: family, child: child }
    customer
  end

end
