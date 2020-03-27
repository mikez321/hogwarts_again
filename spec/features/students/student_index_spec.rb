require 'rails_helper'

RSpec.describe "when I visit /students I see a list of students" do
  it "and the number of profressors each student has" do

    professor_1 = Professor.create!(name: "Larry",
                                    age: "75",
                                    specialty: "Wood Carving")

    professor_2 = Professor.create!(name: "Jim",
                                    age: "40",
                                    specialty: "Magic")

    student_1 = professor_1.students.create!(name: "James",
                                             age: "15",
                                             house: "Brick")

    student_2 = professor_1.students.create!(name: "Molly",
                                             age: "15",
                                             house: "Stone")

    student_3 = professor_2.students.create!(name: "Daryl",
                                             age: "14",
                                             house: "Stone")

   visit '/students'

   expect(page).to have_content("#{student_1.name}")
   expect(page).to have_content("#{student_1.professors.length}")
   expect(page).to have_content("#{student_2.name}")
   expect(page).to have_content("#{student_2.professors.length}")
   expect(page).to have_content("#{student_3.name}")
   expect(page).to have_content("#{student_3.professors.length}")


  end
end
