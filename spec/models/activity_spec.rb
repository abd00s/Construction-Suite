require 'rails_helper'

describe Activity do
  it  "Must have all attributes" do
    activity = Activity.create 
    expect(activity).to_not be_valid
    activity = Activity.create(name: "Test", rate: 10, amount: 100, crew_size: 5, morning_crews: 2, evening_crews: 2, project_id: 1)
    expect(activity).to be_valid    
  end

  it  "Must be associated to a Project" do
    project = Project.create(name: "Pilot", week_length: 5, shift_length: 10)
    activity = project.activities.build(name: "Test", rate: 10, amount: 100, crew_size: 5, morning_crews: 2, evening_crews: 2) 
    expect(activity).to be_valid
    expect(activity.project).to eq(project)
  end  

  describe "#total_man_hours" do
    let!(:project) { Project.create(name: "Pilot") }
    let!(:activity) {project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5)}
    it "Returns rate multiplied by amount" do
      expect(activity.total_man_hours).to eq(10*1000.0)
    end
  end
end