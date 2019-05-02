require "rails_helper"

RSpec.describe "As a visitor" do
  describe "I visit `/comedians`" do
    it "then I see a list of comedians and their attributes" do
      comedian_1 = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      comedian_2 = Comedian.create!(name: "Patton Oswalt", age: 50, birthplace: "Portsmouth, VA", image_url: "https://media.vanityfair.com/photos/592efe8516315d40a9678347/master/w_1536,c_limit/patton-oswalt-interview.jpg")

      visit "/comedians"

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

      visit "/comedians"

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

      visit "/comedians"

      expect(page).to have_css("img[src='#{comedian.image_url}']")
    end
  end

  describe "I visit `/comedians?age=52`" do
    it "then I see the list of comedians on the page only shows comedians who match the age criteria" do
      comedian_1 = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      comedian_2 = Comedian.create!(name: "Patton Oswalt", age: 50, birthplace: "Portsmouth, VA", image_url: "https://media.vanityfair.com/photos/592efe8516315d40a9678347/master/w_1536,c_limit/patton-oswalt-interview.jpg")
      special_1 = comedian_1.specials.create(name: "Obsessed", running_time: 60)
      special_2 = comedian_1.specials.create(name: "Cinco", running_time: 73)
      special_3 = comedian_1.specials.create(name: "Noble Ape", running_time: 90)
      special_4 = comedian_2.specials.create(name: "Werewolves and Lollipops", running_time: 58)
      special_5 = comedian_2.specials.create(name: "Finest Hour", running_time: 76)
      special_6 = comedian_2.specials.create(name: "Tragedy Plus Comedy Equals Time", running_time: 59)

      visit "/comedians?age=#{comedian_1.age}"

      expect(page).to have_content(comedian_1.name)
      expect(page).to have_content(comedian_1.age)
      expect(page).to have_content(comedian_1.birthplace)
      expect(page).to have_css("img[src='#{comedian_1.image_url}']")
      expect(page).to_not have_content(comedian_2.name)
      expect(page).to_not have_content(comedian_2.age)
      expect(page).to_not have_content(comedian_2.birthplace)
      expect(page).to_not have_css("img[src='#{comedian_2.image_url}']")
    end
  end

  describe "I visit `/comedians`" do
    it "then I also see a count of their TV specials" do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      special_1 = comedian.specials.create(name: "Obsessed", running_time: 60)
      special_2 = comedian.specials.create(name: "Cinco", running_time: 73)
      special_3 = comedian.specials.create(name: "Noble Ape", running_time: 90)

      visit "/comedians"

      expect(comedian.specials_count).to eq(3)
    end
  end

  describe "I visit `/comedians`" do
    it "then theres a link to add new comedian" do
      visit "/comedians"

      expect(page).to have_link('', href: '/comedians/new')
    end
  end

  describe "I visit `/comedians`" do
    describe "I see an area at the top of the page called 'Statistics'" do
      it "which shows the average age and unique cities" do
        comedian_1 = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
        comedian_2 = Comedian.create!(name: "Patton Oswalt", age: 50, birthplace: "Portsmouth, VA", image_url: "https://media.vanityfair.com/photos/592efe8516315d40a9678347/master/w_1536,c_limit/patton-oswalt-interview.jpg")
        comedian_3 = Comedian.create!(name: "Tim Gaffigan", age: 22, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
        special_1 = comedian_1.specials.create(name: "Obsessed", running_time: 60)
        special_2 = comedian_1.specials.create(name: "Cinco", running_time: 73)
        special_3 = comedian_2.specials.create(name: "Noble Ape", running_time: 90)
        special_4 = comedian_2.specials.create(name: "Werewolves and Lollipops", running_time: 58)
        special_5 = comedian_3.specials.create(name: "Finest Hour", running_time: 76)
        special_6 = comedian_3.specials.create(name: "Tragedy Plus Comedy Equals Time", running_time: 59)

        visit "/comedians"

        expect(page).to have_content(comedian_1.name)
        expect(page).to have_content(comedian_2.age)
        expect(page).to have_content(comedian_3.birthplace)
        expect(page).to have_content("Statistics")
        expect(page).to have_content("Average age")
        expect(comedian.average_age).to eq(41.3)
        expect(comedian.uniq_locations).to eq(["Elgin, IL", "Portsmouth, VA"])
      end
    end
  end
end
