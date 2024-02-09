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

def  breastfeeding_status_i18n_text(child)
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

def  situation_after_breastfeeding_i18n_text(child)
  if child.easy_to_vomit_milk?
    I18n.t("enums.child.situation_after_breastfeeding.easy_to_vomit_milk")
  elsif child.difficult_to_vomit_milk?
    I18n.t("enums.child.situation_after_breastfeeding.difficult_to_vomit_milk")
  elsif child.none_of_the_above?
    I18n.t("enums.child.situation_after_breastfeeding.none_of_the_above")
  end
end

def  milk_situation_after_baby_food_i18n_text(child)
  if child.drink_breast_milk?
    I18n.t("enums.child.milk_situation_after_baby_food.drink_breast_milk")
  elsif child.drink_formula_milk?
    I18n.t("enums.child.milk_situation_after_baby_food.drink_formula_milk")
  elsif child.not_drinking?
    I18n.t("enums.child.milk_situation_after_baby_food.not_drinking")
  end
end

def  baby_food_progress_i18n_text(child)
  if child.early_weaning_period?
    I18n.t("enums.child.baby_food_progress.early_weaning_period")
  elsif child.middle_weaning_period?
    I18n.t("enums.child.baby_food_progresss.middle_weaning_period")
  elsif child.latter_weaning_period?
    I18n.t("enums.child.baby_food_progress.latter_weaning_period")
  elsif child.the_weaning_completion_period?
    I18n.t("enums.child.baby_food_progress.the_weaning_completion_period")
  elsif child.normal_food?
    I18n.t("enums.child.normal_food")
  end
end

end
