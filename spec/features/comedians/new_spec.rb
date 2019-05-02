require "rails_helper"

RSpec.describe "As a visitor" do
  describe "I visit `/comedians/new`" do
    it "then I see a form to input a new comedian" do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      special_1 = comedian.specials.create(name: "Obsessed", running_time: 60)
      special_2 = comedian.specials.create(name: "Cinco", running_time: 73)
      special_3 = comedian.specials.create(name: "Noble Ape", running_time: 90)

      visit '/comedians/new'

        fill_in 'Name', with: 'Logan Pile'
        fill_in 'Age', with: '33'
        fill_in 'Birthplace', with: 'Oakland, CA'
        fill_in 'Image_url', with: 'https://media.timeout.com/images/103872088/1372/772/image.jpg'
        click_on 'Create Comedian'

        new_comedian = Comedian.last

        expect(current_path).to eq("/comedians")
        expect(page).to have_content(comedian.name)
        expect(page).to have_content(comedian.age)
        expect(page).to have_content(comedian.birthplace)
        expect(page).to have_css("img[src='#{comedian.image_url}']")
        expect(page).to have_content(new_comedian.name)
        expect(page).to have_content(new_comedian.age)
        expect(page).to have_content(new_comedian.birthplace)
        expect(page).to have_css("img[src='#{new_comedian.image_url}']")
    end
  end
end
