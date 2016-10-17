module VertexSetTsort
  def set_dependency_hash
    @dependency_hash = activities.reduce({}) {|memo, act|
      memo[act] = act.dependencies.map{|d| d.predecessor}
      memo
    }
  end
end