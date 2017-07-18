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

  def blood2str(blood)
    case blood
    when Blood::A
      t('blood.a')
    when Blood::B
      t('blood.b')
    when Blood::O
      t('blood.o')
    when Blood::AB
      t('blood.ab')
    else
      t('blood.other')
    end
  end
end
