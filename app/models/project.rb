class Project < ActiveRecord::Base
  include VertexSet
  has_many :activities
end
