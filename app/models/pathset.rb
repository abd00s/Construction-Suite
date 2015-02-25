module Pathset 
  def method
    @vertices = {}
    @prevertex_activities ||= activities.all.to_a
    key = @vertices.count + 1
    activities.all.each_with_index{|activity, index|
      if activity.predecessors.count == 0
        @vertices[key] ||= []
        @vertices[key] << activity
      end
    }    
    @prevertex_activities -= @vertices[key]
    print @prevertex_activities
    puts " ____ "
    print @vertices
  end
end