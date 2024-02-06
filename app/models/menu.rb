class Menu < ApplicationRecord

  has_many :reservations, dependent: :destroy

end
