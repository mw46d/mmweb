module AthletesHelper
  def combined_name(a)
    a.Last_name.strip + ", " + a.First_name.strip  + (a.middle.strip.length > 0 ? " " + a.middle.strip : "")
  end

  def short_name(a)
    a.Last_name.strip + ", " + a.First_name.strip[0,1] + "."
  end
end
