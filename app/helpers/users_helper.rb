module UsersHelper
  def is_author?(user)
    current_user == user ? true : false
  end
  
  def options_for_classification
    [
      ['Bénévole','benevole'],
      ['Demandeur d\'aide','demandeur']
    ]
  end

  def city_list
    [
      ['Paris','paris'],
      ['Ile-de-france','ile-de-france'],
      ['Lyon','lyon']
    ]
  end
end
