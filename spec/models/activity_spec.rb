require 'rails_helper'

RSpec.describe Activity, type: :model do

  let(:valid_attributes) {
    {title: "Test", description: "Test", date: "2020-01-01", start_time: "12:00", end_time: "13:00"}
  }

  let(:invalid_attributes) {
    {title: "Test", description: "Test", date: "2020-01-01", start_time: "14:00", end_time: "13:00"}
  }

  it "is valid with valid attributes" do
    activity = Activity.create! valid_attributes
    expect(activity).to be_valid
  end

  it "is not valid without a title" do
    activity = Activity.new title: nil
    expect(activity).to_not be_valid
  end

  it "is not valid without a description" do
    activity = Activity.new description: nil
    expect(activity).to_not be_valid
  end

  it "is not valid without a date" do
    activity = Activity.new date: nil
    expect(activity).to_not be_valid
  end

  it "is not valid without a start_time" do
    activity = Activity.new start_time: nil
    expect(activity).to_not be_valid
  end

  it "is not valid without a end_time" do
    activity = Activity.new end_time: nil
    expect(activity).to_not be_valid
  end

  it "is not valid if start_time is after end_time" do
    activity = Activity.new invalid_attributes
    expect(activity).to_not be_valid
  end
end
