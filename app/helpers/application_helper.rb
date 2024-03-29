module ApplicationHelper
  BASE_TITLE = "Company Site"

  def full_title(page_title = '')
    if page_title.empty?
      BASE_TITLE
    else
      "#{BASE_TITLE} | #{page_title}"
    end
  end

  def flash_class(type)
    "alert alert-" + case type
      when :success then "success"
      when :notice then "info"
      when :alert then "warning"
      when :error then "danger"
      else "invalid-type"
    end
  end

  def format_time(time)
    formatted_time = if(cookies["browser.timezone"])
      time.in_time_zone(cookies["browser.timezone"]).strftime("%b %d, %Y %I:%M %P")
    else
      time.strftime("%b %d, %Y %I:%M %P %Z")
    end
    formatted_time.gsub(/0(\d:\d\d)/) { $1 }
  end

  def header_links
    {
      home: header_hash("Home", root_path, 'home')
    }
  end

private

  def header_hash(text, path, id, method = false)
    {
      text: text,
      path: path,
      id: "header_#{id}"
    }.tap { |hash| hash[:method] = method if method }
  end

end
