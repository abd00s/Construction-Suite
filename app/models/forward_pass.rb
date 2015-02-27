module ForwardPass
  def set_first_vertex(activities)
    activities[1].each {|activity|
      activity.early_start = 0
      activity.early_finish = activity.duration
      activity.save
    }
    set_remaining_vertices(activities) if activities[2]
  end

  def set_remaining_vertices(vertices)
    vertices.each_with_index{|(vertex,activities), index|
      unless index == 0
        vertices[vertex].each{|activity|
          activity.early_start = activity.predecessors.maximum(:early_finish)
          activity.save
          activity.early_finish = activity.early_start + activity.duration
          activity.save
          # look at activity predecessors
          # set activity.early_start = EF of latest predecessor 
        }
      end
    }
  end
end