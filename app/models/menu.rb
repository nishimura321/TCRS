class Menu < ApplicationRecord

  has_many :reservations, dependent: :destroy
  has_many :facilities_menus, dependent: :destroy
  has_many :facilities, through: :facilities_menus

  validates :date, presence: true
  validates :school_lunch, presence: true
  validates :ingredient, presence: true

  # 検索方法
  def self.search_for(word, search, facility)
    if search == 'perfect_match'
      facility.menus.where(date: word)
    elsif search == 'forward_match'
      facility.menus.where('date LIKE ?', word + '%')
    elsif search == 'backward_match'
      facility.menus.where('date LIKE ?', '%' + word)
    # 以下は部分一致
    else
      facility.menus.where('date LIKE ?', '%' + word + '%')
    end
  end

end
