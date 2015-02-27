module SetFloats
  def set_floats(activities)
    activities.each_value do |vertex|
      vertex.each do |activity|
        set_total_float(activity)
      end
    end
  end

  def set_total_float(activity) 
    activity.total_float = activity.late_start - activity.early_start
    activity.save
  end
end