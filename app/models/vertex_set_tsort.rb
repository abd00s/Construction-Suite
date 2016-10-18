# require 'tsort'

# class Hash
#   include TSort
#   alias tsort_each_node each_key

#   def tsort_each_child(node, &block)
#     puts "node: #{node.name}"
#     puts "fetch node: #{fetch(node)}"
#     fetch(node).each(&block)
#   end
# end

module VertexSetTsort
  def set_dependency_hash
    @dependency_hash = activities.reduce({}) {|memo, act|
      memo[act] = act.parents
      memo
    }

    # topological_sort(@dependency_hash)
  end

  # def topological_sort(ordered_hash)
  #   p ordered_hash.strongly_connected_components#tsort
  # end
end