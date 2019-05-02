require "rails_helper"

RSpec.describe "As a visitor" do
  describe "I visit `/comedians`" do
    it "then I see a list of comedians and their attributes" do
      comedian_1 = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      comedian_2 = Comedian.create!(name: "Patton Oswalt", age: 50, birthplace: "Portsmouth, VA", image_url: "https://media.vanityfair.com/photos/592efe8516315d40a9678347/master/w_1536,c_limit/patton-oswalt-interview.jpg")

      visit '/comedians'

      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content(comedian_1.age)
      expect(page).to have_content(comedian_1.birthplace)

      expect(page).to have_content(comedian_2.name)
      expect(page).to have_content(comedian_2.age)
      expect(page).to have_content(comedian_2.birthplace)
    end
  end

  describe "I visit `/comedians`" do
    it "then I also see a list of each comedian's specials" do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      special_1 = comedian.specials.create(name: "Obsessed", running_time: 60)
      special_2 = comedian.specials.create(name: "Cinco", running_time: 73)
      special_3 = comedian.specials.create(name: "Noble Ape", running_time: 90)

      visit '/comedians'

      expect(page).to have_content(comedian.name)
      expect(page).to have_content(comedian.age)
      expect(page).to have_content(comedian.birthplace)
      expect(page).to have_content(special_1.name)
      expect(page).to have_content(special_1.running_time)
      expect(page).to have_content(special_2.name)
      expect(page).to have_content(special_2.running_time)
      expect(page).to have_content(special_3.name)
      expect(page).to have_content(special_3.running_time)
    end
  end

  describe "I visit `/comedians`" do
    it "then I also see a thumbnail image for each comedian" do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")

      visit '/comedians'

      expect(page).to have_css("img[src='#{comedian.image_url}']")
    end
  end

  describe "I visit `/comedians`" do
    it "then I also see a count of their TV specials" do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      special_1 = comedian.specials.create(name: "Obsessed", running_time: 60)
      special_2 = comedian.specials.create(name: "Cinco", running_time: 73)
      special_3 = comedian.specials.create(name: "Noble Ape", running_time: 90)

      visit '/comedians'

      expect(Special.special_count).to eq(3)
    end
  end
end
