class Project < ActiveRecord::Base
  include Pathset
  has_many :activities
end
