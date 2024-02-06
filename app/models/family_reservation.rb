class FamilyReservation < ApplicationRecord

  belongs_to :reservations
  belongs_to :family

end
