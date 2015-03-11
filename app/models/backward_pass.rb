module BackwardPass
  def back_pass(activities)
    # Reverse order of the vertices
    reversed_activites = activities.to_a.reverse.to_h
    set_lates(reversed_activites)
    set_floats(activities) # Trigger set_floats.rb sequence
  end

  def set_lates(activities)
    # Iterate on vertices
    activities.each{|vertex,contents|
      # Iterate on activities inside current vertex
      contents.each{|activity|
        # Set late finish of activities
        activity.late_finish = if activity.successors.count == 0
          # If activity has no successors, Late Finish equals greater of the activity's
          # early finish or the Early Finish of the latest ending activity
          activity.early_finish >= self.activities.maximum(:early_finish) ? activity.early_finish : self.activities.maximum(:early_finish)
        else
          # If it does have successors, Late Finish equals the earliest start of successors
          activity.successors.minimum(:late_start)
        end
        activity.save
        activity.late_start = activity.late_finish - activity.duration
        activity.save
      }
    }
  end
end