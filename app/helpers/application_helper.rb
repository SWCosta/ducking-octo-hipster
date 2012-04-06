# encoding: utf-8
module ApplicationHelper
  def nav_class(path)
    request.path == path ? "active" : ""
  end

  def nav_link(string, path, options={})
    nav_string = nav_string(string)
    link_to(nav_string, path, options)
  end

  def nav_string(string)
    nav_icon(string) + string
  end

  def nav_icon(string)
    case string
    when "Home" then nav_icon_tag("home")
    when "Darüber" then nav_icon_tag("magnet")
    else nav_icon_tag("placeholder")
    end
  end

  def nav_icon_tag(string)
    content_tag :i, "", :class => "icon-#{string}"
    #tag :i
    #"<i class=>\"icon-#{string}\">"
  end
end
