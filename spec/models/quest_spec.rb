require 'rails_helper'

RSpec.describe Quest, type: :model do
  it "is valid with valid attributes" do
    quest = Quest.new(title: "Complete BMA project")
    expect(quest).to be_valid
  end

  it "is invalid without a title" do
    quest = Quest.new(title: nil)
    expect(quest).not_to be_valid
  end

  it "is complete checbox set false as default" do
    quest = Quest.new(title: "Complete BMA project")
    expect(quest.complete).to be(false)
  end

end
