require 'rails_helper'

describe Project do
  # Validity of Activity
  # it  "Must have all attributes" do
  #   activity = Activity.create
  #   expect(activity).to_not be_valid
  #   activity = Activity.create(name: "Test", rate: 10, amount: 100, crew_size: 5, morning_crews: 2, evening_crews: 2, project_id: 1)
  #   expect(activity).to be_valid
  # end

  # it  "Must be associated to a Project" do
  #   project = Project.create(name: "Pilot", week_length: 5, shift_length: 10)
  #   activity = project.activities.build(name: "Test", rate: 10, amount: 100, crew_size: 5, morning_crews: 2, evening_crews: 2)
  #   expect(activity).to be_valid
  #   expect(activity.project).to eq(project)
  # end

  # Auto Schedule
  describe "#auto_schedule" do
    # Comparison with solution found by hand.
    let!(:project) { Project.create(name: "Pilot") }
    let!(:activity_a) {project.activities.create(name:"VCO", amount: 100, rate: 10, crew_size: 5, duration: 1)}
    let!(:activity_b) {project.activities.create(name:"AS", amount: 100, rate: 10, crew_size: 5, duration: 2)}
    let!(:activity_c) {project.activities.create(name:"EC", amount: 100, rate: 10, crew_size: 5, duration: 3)}
    let!(:activity_d) {project.activities.create(name:"RS", amount: 100, rate: 10, crew_size: 5, duration: 5)}
    let!(:activity_e) {project.activities.create(name:"VS", amount: 100, rate: 10, crew_size: 5, duration: 1)}
    let!(:dependency_1) {Dependency.create(activity_id: activity_c.id, predecessor_id: activity_a.id)}
    let!(:dependency_2) {Dependency.create(activity_id: activity_c.id, predecessor_id: activity_b.id)}
    let!(:dependency_3) {Dependency.create(activity_id: activity_d.id, predecessor_id: activity_b.id)}
    let!(:dependency_4) {Dependency.create(activity_id: activity_e.id, predecessor_id: activity_c.id)}
    it "Populates ES, EF, LS, LF, Total Float, is_critical?" do
      project.auto_schedule
      activity_a.reload
      expect(activity_a.early_start).to eq(0)
      expect(activity_a.early_finish).to eq(1)
      expect(activity_a.late_start).to eq(2)
      expect(activity_a.late_finish).to eq(3)
      expect(activity_a.total_float).to eq(2)
      expect(activity_a.is_critical).to be_falsey  ##correct way be false

      activity_b.reload
      expect(activity_b.early_start).to eq(0)
      expect(activity_b.early_finish).to eq(2)
      expect(activity_b.late_start).to eq(0)
      expect(activity_b.late_finish).to eq(2)
      expect(activity_b.total_float).to eq(0)
      expect(activity_b.is_critical).to be_truthy

      activity_c.reload
      expect(activity_c.early_start).to eq(2)
      expect(activity_c.early_finish).to eq(5)
      expect(activity_c.late_start).to eq(3)
      expect(activity_c.late_finish).to eq(6)
      expect(activity_c.total_float).to eq(1)
      expect(activity_c.is_critical).to be_falsey

      activity_d.reload
      expect(activity_d.early_start).to eq(2)
      expect(activity_d.early_finish).to eq(7)
      expect(activity_d.late_start).to eq(2)
      expect(activity_d.late_finish).to eq(7)
      expect(activity_d.total_float).to eq(0)
      expect(activity_d.is_critical).to be_truthy

      activity_e.reload
      expect(activity_e.early_start).to eq(5)
      expect(activity_e.early_finish).to eq(6)
      expect(activity_e.late_start).to eq(6)
      expect(activity_e.late_finish).to eq(7)
      expect(activity_e.total_float).to eq(1)
      expect(activity_e.is_critical).to be_falsey
    end
  end
end