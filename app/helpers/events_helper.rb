module EventsHelper
  def result_time(e, records = nil)
    ret = ""

    s = e.Fin_stat
    if s && s.strip.length > 0
      ret += "DQ"
    else
      ret += time(e.Fin_Time, true)
    end

    if e.Fin_exh && e.Fin_exh.strip.length > 0
      ret = "X" + ret
    elsif records
      rstr = ""

      records.each do |r|
        if e.Fin_Time > 0 && e.Fin_Time < r.Record_Time
          rstr += (r.record_tag.tag_flag.strip.length > 0 ? r.record_tag.tag_flag : 'R')
        end
      end

      ret = rstr + ret
    end
    
    ret
  end
end
