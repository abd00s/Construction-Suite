module BackwardPass
  def start(activities)
    reversed_activites = activities.to_a.reverse.to_h
    set_lates(reversed_activites)
  end

  def set_lates(activities)
    activities.each{|vertex,contents|
      contents.each{|activity|
        activity.late_finish = if activity.successors.count == 0
          activity.early_finish >= self.activities.maximum(:early_finish) ? activity.early_finish : self.activities.maximum(:early_finish)
        else
          activity.successors.minimum(:late_start)
        end
        activity.save
        activity.late_start = activity.late_finish - activity.duration
        activity.save
      }
    }
  end
end