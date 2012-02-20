module ApplicationHelper
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
end
