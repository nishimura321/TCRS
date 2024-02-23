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
    customer = Customer.find_or_create_by!(last_name: 'guest' ,first_name: 'user' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "guest"
      customer.first_name = "user"
      customer.last_name_kana = "ゲスト"
      customer.first_name_kana = "ユーザー"
      customer.email = 'guest@example.com'
      customer.postal_code = "4200000"
      customer.address = "静岡県静岡市ゲスト町0-00"
      customer.telephone_number = "09000000000"
    end

    child = customer.children.find_or_create_by!(last_name: 'guest' ,first_name: 'child') do |child|
      child.last_name = 'guest'
      child.first_name = 'child'
      child.last_name_kana = 'ゲスト'
      child.first_name_kana = 'チャイルド'
      child.birthday = Date.new(2022, 1, 1)
      child.male = true
      child.has_febrile_seizure = false
      child.has_dislocation = false
      child.has_allergy = false
    end

    family = customer.families.find_or_create_by!(last_name: 'guest' ,first_name: 'user') do |family|
      family.last_name = 'guest'
      family.first_name = 'user'
      family.last_name_kana = 'ゲスト'
      family.first_name_kana = 'ユーザー'
      family.male = false
      family.relationship = 0
      family.birthday = Date.new(1990, 1, 1)
      family.telephone_number = '09000000000'
    end

    #{ customer: customer, family: family, child: child }
    customer
  end

end
