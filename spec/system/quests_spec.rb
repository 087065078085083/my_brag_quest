require 'rails_helper'

RSpec.describe "Quest", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "displays the profile, form, and list" do
    visit quests_path

    # Header
    expect(page).to have_content("My Brag Quest")

    # Profile
    expect(page).to have_content("Wanus Kurirung")
    expect(page).to have_link("My Brag", href: brag_index_path)

    # New Quest Form
    expect(page).to have_content("Add New Quest")
    expect(page).to have_field("quest_title")
    expect(page).to have_button("Add Quest")

    # Quest List Header
    expect(page).to have_content("Your Quests")
  end

  it "creates a new quest" do
    visit quests_path

    fill_in "quest_title", with: "Not die"
    click_button "Add Quest"

    expect(page).to have_content("Not die")
  end

  it "shows validation error if title is blank" do
    visit quests_path

    fill_in "quest_title", with: ""
    click_button "Add Quest"

    # สามารถเช็กด้วยข้อความ error หรือ class field_with_errors
    expect(page).to have_css(".field_with_errors").or have_content(/can't be blank/i)
  end

  context "with existing quests" do
    before do
      Quest.create!(title: "Task A")
      Quest.create!(title: "Task B")
    end

    it "lists all quests" do
      visit quests_path

      expect(page).to have_content("Task A")
      expect(page).to have_content("Task B")
    end
  end
end
