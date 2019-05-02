require "rails_helper"

describe "user visit /comedians" do
  describe "user sees list of all comedians" do
    it "displays comedian's attributes" do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")

      visit comedians_path

      expect(page).to have_content(comedian.name)
      expect(page).to have_content(comedian.age)
      expect(page).to have_content(comedian.birthplace)
    end
  end

  describe "user sees list of comedian's specials" do
    it "displays a list of comedian's specials" do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      special_1 = comedian.specials.create(name: "Obsessed", running_time: 60)
      special_2 = comedian.specials.create(name: "Cinco", running_time: 73)
      special_3 = comedian.specials.create(name: "Noble Ape", running_time: 90)

      visit comedians_path

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

  describe "user sees image of comedian" do
    it "displays thumbnail image for each comedian" do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")

      visit comedians_path

      expect(page).to have_css("img[src='#{comedian.image_url}']")
    end
  end

  describe "user sees image of comedian" do
    it "displays the count of specials for each comedian" do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      special_1 = comedian.specials.create(name: "Obsessed", running_time: 60)
      special_2 = comedian.specials.create(name: "Cinco", running_time: 73)
      special_3 = comedian.specials.create(name: "Noble Ape", running_time: 90)

      visit comedians_path

      expect(Special.special_count).to eq(3)
    end
  end
end
