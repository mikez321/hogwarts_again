require 'rails_helper'

RSpec.describe "when I visit /professors I see a list of professors" do
  it "including their name age and specialty" do

    professor_1 = Professor.create!(name: "Larry",
                                    age: "75",
                                    specialty: "Wood Carving")

    professor_2 = Professor.create!(name: "Jim",
                                    age: "40",
                                    specialty: "Magic")
                                    

   visit '/professors'

    expect(page).to have_content("#{professor_1.name}")
    expect(page).to have_content("#{professor_1.age}")
    expect(page).to have_content("#{professor_1.specialty}")

    expect(page).to have_content("#{professor_2.name}")
    expect(page).to have_content("#{professor_2.age}")
    expect(page).to have_content("#{professor_2.specialty}")
  end
end
