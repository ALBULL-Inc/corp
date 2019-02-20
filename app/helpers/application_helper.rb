module ApplicationHelper
  def bbr(str="")
    html_escape(str).gsub(/\r\n|\r|\n/, "<br />").html_safe
  end

  def jsonld_script_tag
    jsonld = controller.render_to_string(formats: :jsonld)
    content_tag :script, jsonld.html_safe, type: Mime[:jsonld].to_s
  rescue ActionView::ActionViewError => e
    logger.error e.message
    nil
  ensure
    # render_to_string のバグ回避 https://github.com/rails/rails/issues/14173
    lookup_context.rendered_format = nil
  end
end
