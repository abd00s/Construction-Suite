class Activity < ActiveRecord::Base
  include ManhourEstimator
  belongs_to :project
  validates :name, :amount, :rate, :crew_size, :morning_crews, :evening_crews, :project_id, presence: true
  validates_associated :project

  has_many :dependencies
  has_many :predecessors, :through => :dependencies

  has_many :inverse_dependencies, :class_name => "Dependency", :foreign_key => "predecessor_id"
  has_many :successors, :through => :inverse_dependencies, :source => :activity  
end
