class Reservation < ApplicationRecord

  belongs_to :customer
  belongs_to :child
  belongs_to :facilities
  belongs_to :menus
  has_many :families_reservations, dependent: :destroy

end
