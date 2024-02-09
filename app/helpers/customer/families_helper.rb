module Customer::FamiliesHelper


def  relationship_i18n_text(family)
  if family.mother?
    I18n.t("enums.family.relationship.mother")
  elsif family.father?
    I18n.t("enums.family.relationship.father")
  elsif family.grandmother?
    I18n.t("enums.family.relationship.grandmother")
  elsif family.grandfather?
    I18n.t("enums.family.relationship.grandfather")
  elsif family.other?
    I18n.t("enums.family.relationship.other")
  end
end

end
