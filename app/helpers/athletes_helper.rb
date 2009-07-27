module AthletesHelper
  def combined_name(a)
    a.Last_name.strip + ", " + a.First_name.strip  + (a.Initial.strip.length > 0 ? " " + a.Initial.strip : "")
  end

  def short_name(a)
    a.Last_name.strip + ", " + a.First_name.strip[0,1] + "."
  end
end
