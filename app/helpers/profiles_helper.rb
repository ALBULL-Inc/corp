module ProfilesHelper
  def gender2str(gender)
    case gender
    when Gender::MALE
      "男"
    when Gender::FEMALE
      "女"
    else
      ""
    end
  end
end
