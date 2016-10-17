class Project < ActiveRecord::Base
  include VertexSet
  include ForwardPass
  include BackwardPass
  include SetFloats
  include VertexSetTsort
  has_many :activities
end
