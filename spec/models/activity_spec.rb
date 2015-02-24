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

  describe "#crew_productivity" do
    let!(:project) { Project.create(name: "Pilot") }
    let!(:activity) {project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5)}
    it "Returns crew size multiplied by hours in shift" do
      expect(activity.crew_productivity).to eq(5*10)
      expect(activity.crew_productivity.class).to eq(Float)
    end
  end

  describe "#shifts_to_completion" do
    let!(:project) { Project.create(name: "Pilot") }
    let!(:activity) {project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5)}
    it "Returns number of shifts it will require one crew to carryout work" do
      expect(activity.shifts_to_completion).to eq(activity.total_man_hours/activity.crew_productivity)
      expect(activity.shifts_to_completion.class).to eq(Float)
    end
  end  

  describe "#crews_per_day" do
    let!(:project) { Project.create(name: "Pilot") }
    let!(:activity) {project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5, evening_crews: 1)}
    it "Adds morning_crews and evening_crews" do
      expect(activity.crews_per_day).to eq(2)
    end
  end

  describe "#total_days" do
    let!(:project) { Project.create(name: "Pilot") }
    let!(:activity) {project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5)}
    it "Calculates total number of working days to completion" do
      expect(activity.total_days).to eq(activity.shifts_to_completion/activity.crews_per_day)
      expect(activity.total_days.class).to eq(Float)
    end
  end  

  describe "#actual_weeks" do
    let!(:project) { Project.create(name: "Pilot") }
    let!(:activity) {project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5)}
    it "Calculates total number of actual weeks to completion rounded up" do
      expect(activity.actual_weeks).to eq((activity.total_days/project.week_length).ceil)
      expect(activity.actual_weeks.class).to eq(Fixnum)
    end

    it "[EXAMPLES] Calculates total number of actual weeks to completion" do
      expect(activity.actual_weeks).to eq(40)
      activity = project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5, evening_crews: 1)
      expect(activity.actual_weeks).to eq(20)
      activity = project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5, morning_crews: 2, evening_crews: 1)
      expect(activity.actual_weeks).to eq(14)
      activity = project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5, morning_crews: 2, evening_crews: 2)
      expect(activity.actual_weeks).to eq(10)
      activity = project.activities.build(name: "Test", rate: 10, amount: 1000, crew_size: 5, morning_crews: 3, evening_crews: 2)
      expect(activity.actual_weeks).to eq(8)            
    end
  end      
end