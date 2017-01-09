module ContactsHelper
  def contact_types_options
    Contact::TYPE.to_a.map do |k,v|
      [v, t("contact.#{k}")]
    end
  end
end
