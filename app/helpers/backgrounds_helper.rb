module BackgroundsHelper
  def background2str(type)
    case type
    when Background::TYPE[:education]
      t('background.education')
    when Background::TYPE[:employment]
      t('background.employment')
    else
      t('background.other')
    end
  end

  def collection_values
    Background::TYPE.to_a.map do |k,v|
      [v, t("background.#{k}")]
    end
  end
end
