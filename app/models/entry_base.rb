class EntryBase < ActiveRecord::Base
  self.abstract_class = true
  belongs_to :event, :class_name => "Event", :foreign_key => "Event_ptr"

  def result_compare(b)
    if self.Fin_place.nil?
      return 1
    end

    if b.Fin_place.nil?
      return -1
    end

    if self.Fin_place > 0
      if b.Fin_place == 0
        return -1
      else
        return self.Fin_place <=> b.Fin_place
      end
    else
      if b.Fin_place > 0
        return 1
      end
    end

    if self.Fin_exh
      if b.Fin_exh
        return EntryBase.time_compare(self.Fin_Time, b.Fin_Time)
      else
        return -1
      end
    end

    if b.Fin_exh
      return 1
    end

    return EntryBase.time_compare(self.Fin_Time, b.Fin_Time)
  end

  class << self
    def time_compare(a, b)
      if a.nil? || a == 0
        if b.nil? || b == 0
          return 0
        else
          return 1
        end
      end

      if b.nil? || b == 0
        return -1
      end

      return a <=> b
    end
  end
end
