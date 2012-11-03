module ApplicationHelper
  # Highlight form field if there's any error
  def normal_div_if(condition, attributes = {}, &block)
    if condition
      attributes["class"] = "control-group"
    else
      attributes["class"] = "control-group error"
    end
    content_tag("div", attributes, &block)
  end

  # TODO: Test show_flash
  def show_flash(notice, alert)
    type = notice.blank? ? "error" : "success"

    html = ""
    unless notice.blank? and alert.blank?
      html += content_tag :div, id: "flash", class: "alert alert-#{type} fade in" do
        content_tag(:a, raw("&times;"), class: "close", :"data-dismiss" => "alert", href: "#") +
        (notice || alert)
      end
    end
    raw html
  end

  # TODO: Test show_location
  def show_location(location)
    unless location.blank?
      text = location.nama
      unless location.state.nil?
        text = "#{location.state.nama}, #{location.nama}"
      end
    end
  end
end
