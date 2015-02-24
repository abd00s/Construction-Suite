class Activity < ActiveRecord::Base
  include ManhourEstimator
  belongs_to :project
  validates :name, :amount, :rate, :crew_size, :morning_crews, :evening_crews, :project_id, presence: true
end
