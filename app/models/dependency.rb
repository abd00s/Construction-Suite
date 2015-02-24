class Dependency < ActiveRecord::Base
  belongs_to :activity
  belongs_to :dependent, :class_name => 'Activity'
end
