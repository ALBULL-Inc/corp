module ProfilesHelper
  def gender2str(gender)
    case gender
    when Gender::MALE
      t('gender.male')
    when Gender::FEMALE
      t('gender.female')
    else
      t('gender.other')
    end
  end
end
