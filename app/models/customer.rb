class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum breastfeeding_status_method: { no_selection: 0, breast_milk_only: 1, breast_milk_and_formula_milk: 2, formula_milk_only: 3, follow_up_milk: 4, milk: 5 }
  enum situation_after_breastfeeding_method: { no_selection: 0, easy_to_vomit_milk: 1, difficult_to_vomit_milk: 2, none_of_the_above: 3 }
  enum milk_situation_after_baby_food_method: { no_selection: 0, drink_breast_milk: 1, drink_formula_milk: 2, not_drinking: 3 }
  enum baby_food_progress_method: { no_selection: 0, early_weaning_period: 1, middle_weaning_period: 2, latter_weaning_period: 3, the_weaning_completion_period: 4, normal_food: 5 }
  enum appetite_method: { no_selection: 0, eat_a_lot: 1, eat_a_standard_amount: 2, children_do_not_eat_much: 3, eating_unevenly: 4 }
  enum how_to_eat_method: { no_selection: 0, feed_a_child: 1, eat_with_one’s_hand: 2, eat_alone_with_a_spoon: 3, eat_with_hands_and_spoon: 4, eat_with_chopsticks: 5 }
  enum how_to_lay_it_down_method: { alone: 0, co_sleeping: 1, baby_carrying: 2, cradling: 3 }
  enum falling_asleep_method: { no_selection: 0, falling_asleep_easily: 1, have_trouble_sleeping: 2, there_are_both: 3 }
  enum waking_up_method: { no_selection: 0, waking_up_easily: 1, unable_to_get_to_sleep: 2, there_are_both: 3 }
  enum sleeping_position_method: { sleep_on_your_back: 0, sleep_on_your_side: 1, sleep_on_your_stomach: 2 }
  enum diaper_usage_method: { no_selection: 0, diaper: 1, cloth_diaper: 2, paper_pants: 3, cloth_pants: 4 }
  enum urination_method: { no_selection: 0, pee_in_omar: 1, pee_in_the_toilet: 2, tell_me_after_peeing_in_the_pants: 3, do_not_tell: 4, pee_by_myself: 5 }
  enum defecation_method: { no_selection: 0, hard_poop: 1, normal_poop: 2, soft_poop: 3, feeling_constipated: 4 }

end
