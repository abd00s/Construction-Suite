module ManhourEstimator
  def total_man_hours
    amount * rate
  end

  def crew_productivity
    crew_size * project.shift_length
  end

  def shifts_to_completion #per one crew
    total_man_hours / crew_productivity
  end

  def crews_per_day
    morning_crews + evening_crews
  end

  def total_days
    shifts_to_completion / crews_per_day
  end

  def actual_weeks
    total_days / project.week_length
  end
end