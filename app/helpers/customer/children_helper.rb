module Customer::ChildrenHelper

#年齢を返すメソッド
def age_in_years(birthday)
  now = Time.now
  age = now.year - birthday.year
  age -= 1 if now.month < birthday.month || (now.month == birthday.month && now.day < birthday.day)
  age
end

#月齢を返すメソッド
def age_in_months(birthday)
  now = Time.now
  if now.month >= birthday.month
    age_in_months = now.month - birthday.month
  else
    age_in_months = (12 - birthday.month) + now.month
  end
  age_in_months -= 1 if now.day < birthday.day
  #以下は月齢がマイナスになる場合月齢を0にするための処理
  age_in_months = 0 if age_in_months < 0
  age_in_months
end

def breastfeeding_status_i18n_text(child)
  if child.breast_milk_only?
    I18n.t("enums.child.breastfeeding_status.breast_milk_only")
  elsif child.breast_milk_and_formula_milk?
    I18n.t("enums.child.breastfeeding_status.breast_milk_and_formula_milk")
  elsif child.formula_milk_only?
    I18n.t("enums.child.breastfeeding_status.formula_milk_only")
  elsif child.follow_up_milk?
    I18n.t("enums.child.breastfeeding_status.follow_up_milk")
  elsif child.milk?
    I18n.t("enums.child.breastfeeding_status.milk")
  end
end

def situation_after_breastfeeding_i18n_text(child)
  if child.easy_to_vomit_milk?
    I18n.t("enums.child.situation_after_breastfeeding.easy_to_vomit_milk")
  elsif child.difficult_to_vomit_milk?
    I18n.t("enums.child.situation_after_breastfeeding.difficult_to_vomit_milk")
  elsif child.none_of_the_above?
    I18n.t("enums.child.situation_after_breastfeeding.none_of_the_above")
  end
end

def milk_situation_after_baby_food_i18n_text(child)
  if child.drink_breast_milk?
    I18n.t("enums.child.milk_situation_after_baby_food.drink_breast_milk")
  elsif child.drink_formula_milk?
    I18n.t("enums.child.milk_situation_after_baby_food.drink_formula_milk")
  elsif child.not_drinking?
    I18n.t("enums.child.milk_situation_after_baby_food.not_drinking")
  end
end

def baby_food_progress_i18n_text(child)
  if child.early_weaning_period?
    I18n.t("enums.child.baby_food_progress.early_weaning_period")
  elsif child.middle_weaning_period?
    I18n.t("enums.child.baby_food_progresss.middle_weaning_period")
  elsif child.latter_weaning_period?
    I18n.t("enums.child.baby_food_progress.latter_weaning_period")
  elsif child.the_weaning_completion_period?
    I18n.t("enums.child.baby_food_progress.the_weaning_completion_period")
  elsif child.normal_food?
    I18n.t("enums.child.baby_food_progress.normal_food")
  end
end

def appetite_i18n_text(child)
  if child.eat_a_lot?
    I18n.t("enums.child.appetite.eat_a_lot")
  elsif child.eat_a_standard_amount?
    I18n.t("enums.child.appetite.eat_a_standard_amount")
  elsif child.children_do_not_eat_much?
    I18n.t("enums.child.appetite.children_do_not_eat_much")
  elsif child.eating_unevenly?
    I18n.t("enums.child.appetite.eating_unevenly")
  end
end

def how_to_eat_i18n_text(child)
  if child.feed_a_child?
    I18n.t("enums.child.how_to_eat.feed_a_child")
  elsif child.eat_with_one’s_hand?
    I18n.t("enums.child.how_to_eat.eat_with_one’s_hand")
  elsif child.eat_alone_with_a_spoon?
    I18n.t("enums.child.how_to_eat.eat_alone_with_a_spoon")
  elsif child.eat_with_hands_and_spoon?
    I18n.t("enums.child.how_to_eat.eat_with_hands_and_spoon")
  elsif child.eat_with_chopsticks?
    I18n.t("enums.child.how_to_eat.eat_with_chopsticks")
  end
end

def how_to_lay_it_down_i18n_text(child)
  if child.alone?
    I18n.t("enums.child.how_to_lay_it_down.alone")
  elsif child.co_sleeping?
    I18n.t("enums.child.how_to_lay_it_down.co_sleeping")
  elsif child.baby_carrying?
    I18n.t("enums.child.how_to_lay_it_down.baby_carrying")
  elsif child.cradling?
    I18n.t("enums.child.how_to_lay_it_down.cradling")
  end
end

def falling_asleep_i18n_text(child)
  if child.falling_asleep_easily?
    I18n.t("enums.child.falling_asleep.falling_asleep_easily")
  elsif child.have_trouble_sleeping?
    I18n.t("enums.child.falling_asleep.have_trouble_sleeping")
  elsif child.there_are_both?
    I18n.t("enums.child.falling_asleep.there_are_both")
  end
end

def waking_up_i18n_text(child)
  if child.waking_up_easily?
    I18n.t("enums.child.waking_up.waking_up_easily")
  elsif child.unable_to_get_to_sleep?
    I18n.t("enums.child.waking_up.unable_to_get_to_sleep")
  elsif child.both_0_and_1?
    I18n.t("enums.child.waking_up.both_0_and_1")
  end
end

def sleeping_position_i18n_text(child)
  if child.sleep_on_your_back?
    I18n.t("enums.child.sleeping_position.sleep_on_your_back")
  elsif child.sleep_on_your_side?
    I18n.t("enums.child.sleeping_position.sleep_on_your_side")
  elsif child.sleep_on_your_stomach?
    I18n.t("enums.child.sleeping_position.sleep_on_your_stomach")
  end
end

def diaper_usage_i18n_text(child)
  if child.diaper?
    I18n.t("enums.child.diaper_usage.diaper")
  elsif child.cloth_diaper?
    I18n.t("enums.child.diaper_usage.cloth_diaper")
  elsif child.paper_pants?
    I18n.t("enums.child.diaper_usage.paper_pants")
  elsif child.cloth_pants?
    I18n.t("enums.child.diaper_usage.cloth_pants")
  end
end

def urination_i18n_text(child)
  if child.pee_in_omar?
    I18n.t("enums.child.urination.pee_in_omar")
  elsif child.pee_in_the_toilet?
    I18n.t("enums.child.urination.pee_in_the_toilet")
  elsif child.tell_me_after_peeing_in_the_pants?
    I18n.t("enums.child.urination.tell_me_after_peeing_in_the_pants")
  elsif child.do_not_tell?
    I18n.t("enums.child.urination.do_not_tell")
  elsif child.pee_by_myself?
    I18n.t("enums.child.urination.pee_by_myself")
  end
end

def defecation_i18n_text(child)
  if child.hard_poop?
    I18n.t("enums.child.defecation.hard_poop")
  elsif child.normal_poop?
    I18n.t("enums.child.defecation.normal_poop")
  elsif child.soft_poop?
    I18n.t("enums.child.defecation.soft_poop")
  elsif child.feeling_constipated?
    I18n.t("enums.child.defecation.feeling_constipated")
  end
end

end
