class Child < ApplicationRecord

  belongs_to :customer
  has_many :reservations, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  validates :male, inclusion: { in: [true, false] }
  validates :has_febrile_seizure, inclusion: { in: [true, false] }
  validates :has_dislocation, inclusion: { in: [true, false] }
  validates :has_allergy, inclusion: { in: [true, false] }

  enum breastfeeding_status: { breast_milk_only: 0, breast_milk_and_formula_milk: 1, formula_milk_only: 2, follow_up_milk: 3, milk: 4 }
  enum situation_after_breastfeeding: { easy_to_vomit_milk: 0, difficult_to_vomit_milk: 1, none_of_the_above: 2 }
  enum milk_situation_after_baby_food: { drink_breast_milk: 0, drink_formula_milk: 1, not_drinking: 2 }
  enum baby_food_progress: { early_weaning_period: 0, middle_weaning_period: 1, latter_weaning_period: 2, the_weaning_completion_period: 3, normal_food: 4 }
  enum appetite: { eat_a_lot: 0, eat_a_standard_amount: 1, children_do_not_eat_much: 2, eating_unevenly: 3 }
  enum how_to_eat: { feed_a_child: 0, eat_with_one’s_hand: 1, eat_alone_with_a_spoon: 2, eat_with_hands_and_spoon: 3, eat_with_chopsticks: 4 }
  enum how_to_lay_it_down: { alone: 0, co_sleeping: 1, baby_carrying: 2, cradling: 3 }
  enum falling_asleep: { falling_asleep_easily: 0, have_trouble_sleeping: 1, there_are_both: 2 }
  enum waking_up: { waking_up_easily: 0, unable_to_get_to_sleep: 1, both_0_and_1: 2 }
  enum sleeping_position: { sleep_on_your_back: 0, sleep_on_your_side: 1, sleep_on_your_stomach: 2 }
  enum diaper_usage: { diaper: 0, cloth_diaper: 1, paper_pants: 2, cloth_pants: 3 }
  enum urination: { pee_in_omar: 0, pee_in_the_toilet: 1, tell_me_after_peeing_in_the_pants: 2, do_not_tell: 3, pee_by_myself: 4 }
  enum defecation: { hard_poop: 0, normal_poop: 1, soft_poop: 2, feeling_constipated: 3 }

  #予約時セレクトボックスに表示される名前
  def child_name
   last_name + first_name
  end

end
