class Family < ApplicationRecord

  belongs_to :customer

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :male, presence: true
  validates :relationship, presence: true
  validates :date_of_birth, presence: true
  validates :telephone_number, presence: true

  enum relationship_method: { mother: 0, father: 1, grandmother: 2, grandfather: 3, other: 4 }

end
