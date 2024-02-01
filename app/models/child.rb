class Child < ApplicationRecord

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :date_of_birth, presence: true
  validates :male, presence: true
  validates :has_febrile_seizure, presence: true
  validates :has_dislocation, presence: true
  validates :has_allergy, presence: true

end
