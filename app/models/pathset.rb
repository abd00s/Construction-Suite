module Pathset 
  $vertices = {}
  def method
    $prevertex_activities = activities.all.to_a
    key = $vertices.count + 1
    activities.all.each_with_index{|activity, index|
      if activity.successors.count == 0
        $vertices[key] ||= []
        $vertices[key] << activity
      end
      # puts activity.name
      # puts index
      # puts "__"
    }    
    $prevertex_activities -= $vertices[key]
    print $prevertex_activities
  end
end