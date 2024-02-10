class FamiliesReservation < ApplicationRecord

  belongs_to :reservations
  belongs_to :family

end
