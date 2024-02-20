class Family < ApplicationRecord

  belongs_to :customer
  has_many :families_reservations, dependent: :destroy
  has_many :reservations, through: :families_reservations

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :male, inclusion: { in: [true, false] }
  validates :relationship, presence: true
  validates :birthday, presence: true
  validates :telephone_number, presence: true

  enum relationship: { mother: 0, father: 1, grandmother: 2, grandfather: 3, other: 4 }

  #予約時セレクトボックスに表示される名前
  def family_name
    last_name + first_name
  end

end
