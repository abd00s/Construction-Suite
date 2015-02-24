require 'rails_helper'

describe Activity do
  let!(:activity) { Activity.create }
  it  "Must have all attributes" do 
    expect(activity).to_not be_valid
  end
end