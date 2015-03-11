module ForwardPass
  def set_first_vertex(activities)
    # Set Early Start and Finish for activities in the first vertex
    # ES is 0 as there are no predecessors for activities in this vertex
    activities[1].each {|activity|
      activity.early_start = 0
      activity.early_finish = activity.duration
      activity.save
    }
    set_remaining_vertices(activities) if activities[2]
  end

  def set_remaining_vertices(vertices)
    # Iterate on remaining vertices
    vertices.each_with_index{|(vertex,activities), index|
      unless index == 0
        vertices[vertex].each{|activity|
          # Early Start is equal to the greatest Early Finish of predecessors
          activity.early_start = activity.predecessors.maximum(:early_finish)
          activity.save
          activity.early_finish = activity.early_start + activity.duration
          activity.save
        }
      end
    }
    back_pass(vertices) # Trigger first step of backward_pass.rb
  end
end