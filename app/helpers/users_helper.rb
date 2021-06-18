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
end
