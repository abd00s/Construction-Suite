module VertexSet
  def auto_schedule
    initialize_vertices
  end
  def initialize_vertices
    @vertices = {}
    @prevertex_activities = activities.all.to_a
    populate_vertices(@prevertex_activities)
  end

  def populate_vertices(activities)
    # Current vertex to include activities without dependencies on remaining(unassigned) tasks
    if !activities.empty?
      key = @vertices.count + 1
      activities.each{|activity|
        if (activity.predecessors & activities).empty? #If activity doesn't have predecessors
          @vertices[key] ||= []                        #in remaining tasks
          @vertices[key] << activity
        end
      }
      remove_independents(@vertices[key])
    else
      @vertices
      set_first_vertex(@vertices) # Trigger first step of forward_pass.rb sequence
    end
  end

  def remove_independents(activities)
    # Remove activities that are assigned to a vertex
    @prevertex_activities = @prevertex_activities - activities
    populate_vertices(@prevertex_activities)
  end
end