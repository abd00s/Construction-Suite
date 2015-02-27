module BackwardPass
  def start(activities)
    reversed_activites = activities.to_a.reverse.to_h
    set_lates(reversed_activites)
  end

  def set_lates(activities)
    
  end
end