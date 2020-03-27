require 'rails_helper'

RSpec.describe "when I visit a professors show page" do
  it "I see the average age of the students of that professor" do

    professor_1 = Professor.create!(name: "Larry",
                                    age: "75",
                                    specialty: "Wood Carving")

    student_1 = professor_1.students.create!(name: "James",
                                             age: "15",
                                             house: "Brick")

    student_2 = professor_1.students.create!(name: "Molly",
                                             age: "15",
                                             house: "Stone")

   visit "/professors/#{professor_1.id}"

    expect(page).to have_content("Average Student Age: 15")

  end
end
