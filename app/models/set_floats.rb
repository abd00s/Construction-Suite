module SetFloats
  def set_floats(activities)
    activities.each_value do |vertex|
      vertex.each do |activity|
        set_total_float(activity)
        check_criticality(activity)
      end
    end
  end

  def set_total_float(activity) 
    activity.total_float = activity.late_start - activity.early_start
    activity.save
  end

  def check_criticality(activity)
    activity.is_critical = (activity.total_float == 0) ? true : false
    activity.save
  end
end