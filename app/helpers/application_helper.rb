module ApplicationHelper
  def bbr(str="")
    html_escape(str).gsub(/\r\n|\r|\n/, "<br />").html_safe
  end
end
