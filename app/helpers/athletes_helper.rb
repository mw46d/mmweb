module AthletesHelper
  def combined_name(a)
    a.Last_name.strip + ", " + a.First_name.strip  + (a.middle.strip.length > 0 ? " " + a.middle.strip : "")
  end

  def short_name(a)
    a.Last_name.strip + ", " + a.First_name.strip[0,1] + "."
  end

  def alpha_links(athletes)
    ret = ""
    last_char = ""
    anchors = {}

    athletes.each do |athlete|
      l = athlete.Last_name.upcase[0,1]

      unless last_char == l
	anchors[l] = l
	last_char = l
      end
    end

    ('A' .. 'Z').each do |a|
      ret += (anchors[a] ? '<a href="#' + anchors[a] + '">' : '') + a + (anchors[a] ? '</a>' : '') + '&nbsp;'
    end

    ret.html_safe
  end
end
