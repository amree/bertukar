module ApplicationHelper
  def normal_div_if(condition, attributes = {}, &block)
    if condition
      attributes["class"] = "control-group"
    else
      attributes["class"] = "control-group error"
    end
    content_tag("div", attributes, &block)
  end

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

  def dash_if_nil(val)
    val.nil? || val.strip == "" ? "-" : val
  end

  def starting_row_number(current_page)
    if current_page.blank?
      current_page = 0
    else
      Kaminari.config.default_per_page * (Integer(current_page) - 1)
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end
end
