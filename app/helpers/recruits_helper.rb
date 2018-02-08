module RecruitsHelper
  def employment_types_options
    Employment::TYPE.to_a.map do |k,v|
      [v, t("recruit.#{k}")]
    end
  end
end
