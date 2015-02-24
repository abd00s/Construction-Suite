class Activity < ActiveRecord::Base
  include ManhourEstimator
  belongs_to :project
end
