class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum breastfeeding_status_method: { no_selection: 0, breast_milk_only: 1, breast_milk_and_formula_milk: 2, formula_milk_only: 3, follow_up_milk: 4, milk: 5 }
  enum situation_after_breastfeeding_method: { no_selection: 0, easy_to_vomit_milk: 1, difficult_to_vomit_milk: 2, none_of_the_above: 3 }
  enum milk_situation_after_baby_food_method: { no_selection: 0, drink_breast_milk: 1, difficult_to_vomit_milk: 2, none_of_the_above: 3 }
  enum baby_food_progress_method: { no_selection: 0, early_weaning_period: 1, middle_weaning_period: 2, latter_weaning_period: 3, the_weaning_completion_period: 4, normal_food: 5 }
  enum appetite_method: { no_selection: 0, eat_a_lot: 1, eat_a_standard_amount: 2, children_do_not_eat_much: 3, eating_unevenly: 4 }
  enum how_to_eat_method: { no_selection: 0, feed_a_child: 1, eat_with_one’s_hand: 2, eat_alone_with_a_spoon: 3, eat_with_hands_and_spoon: 4, eat_with_chopsticks: 5 }

end
