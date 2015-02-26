class Project < ActiveRecord::Base
  include VertexSet
  include ForwardPass
  has_many :activities
end
