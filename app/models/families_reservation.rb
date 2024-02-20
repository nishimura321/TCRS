class FamiliesReservation < ApplicationRecord

  belongs_to :family
  belongs_to :reservation

end
