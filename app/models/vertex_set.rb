module VertexSet 
  def initialize_vertices
    @vertices = {}
    @prevertex_activities = activities.all.to_a
    method(@prevertex_activities)
  end

  def method(activities)
    if !activities.empty?
      key = @vertices.count + 1
      activities.each{|activity|
        if (activity.predecessors & activities).empty?
          @vertices[key] ||= []
          @vertices[key] << activity
        end
      }
      remove_independents(@vertices[key])
    else
      @vertices
      set_first_vertex(@vertices)
    end
  end

  def remove_independents(activities)
    @prevertex_activities = @prevertex_activities - activities
    method(@prevertex_activities)
  end
end