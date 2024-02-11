class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :children, dependent: :destroy
  has_many :families, dependent: :destroy
  has_many :reservations, dependent: :destroy

  #ゲストログイン用メソッド
  def self.guest
    Customer.find_or_create_by!(last_name: 'guest' ,first_name: 'user' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.last_name = "guest"
      customer.first_name = "user"
      customer.last_name_kana = "ゲスト"
      customer.first_name_kana = "ユーザー"
      customer.postal_code = "4200000"
      customer.address = "静岡県静岡市ゲスト町0-00"
      customer.telephone_number = "09000000000"
    end

    child = customer.children.find_or_create_by!(last_name: 'guest') do |child|
      child.last_name = 'guest'
      child.first_name = 'child'
      child.last_name_kana = 'ゲスト'
      child.first_name_kana = 'チャイルド'
      child.birthday = Date.new(2022, 1, 1)
      child.male = true
      child.has_febrile_seizure = false
      child.has_dislocation = false
      child.has_allergy = true
    end

    family = customer.families.find_or_create_by!(last_name: 'guest') do |family|
      family.last_name = 'guest'
      family.first_name = 'user'
      family.last_name_kana = 'ゲスト'
      family.first_name_kana = 'ユーザー'
      family.male = false
      family.relationship = 0
      family.birthday = Date.new(1990, 1, 1)
    end

    { customer: customer, family: family, child: child }
  end

end
