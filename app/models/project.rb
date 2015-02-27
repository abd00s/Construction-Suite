class Project < ActiveRecord::Base
  include VertexSet
  include ForwardPass
  include BackwardPass
  include SetFloats
  has_many :activities
end
