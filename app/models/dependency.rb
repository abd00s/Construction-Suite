class Dependency < ActiveRecord::Base
  belongs_to :activity
  belongs_to :predecessor, :class_name => 'Activity'
end
