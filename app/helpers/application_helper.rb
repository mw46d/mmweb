# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def place(a)
    if a == 0
      ""
    else
      a.to_s
    end
  end

  def score(f)
    if f.nil? || f == 0
      ""
    elsif f - f.to_i == 0
      f.to_i.to_s
    else
      "%.2f" % f
    end
  end

  def time(f, ns = false)
    if f.nil? || f == 0
      if ns
        ""
      else
        "NT"
      end
    else
      ret = ""
      min = f.to_i / 60

      if min > 0
        ret += min.to_s + ":"
        f -= min * 60
      end

      ret += "%05.2f" % f
      ret
    end
  end

  def toggle_small
    url = url_for

    if url =~ /\/small\//
      url.sub(/\/small/, '')
    else
      url.sub(%r{^(http.?://[^/]*)?(.*)}) { "#{$1}/small#{$2}" }
    end
  end
end
