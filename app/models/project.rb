class Project < ActiveRecord::Base
  include VertexSet
  include ForwardPass
  include BackwardPass
  has_many :activities
end
