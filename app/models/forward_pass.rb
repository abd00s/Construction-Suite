module ForwardPass
  def set_first_vertex(activities)
    activities[1].each {|activity|
      activity.early_start = 0
      activity.early_finish = activity.duration
      activity.save
    }
  end
end