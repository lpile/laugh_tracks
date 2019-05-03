require "rails_helper"

RSpec.describe "As a visitor" do
  before :each do
    Comedian.destroy_all

    @comedian_1 = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
    @comedian_2 = Comedian.create!(name: "Dave Chappelle", age: 45, birthplace: "Washington, D.C.", image_url: "https://stmedia.stimg.co/ows_14647556412335.jpg?auto=compress&crop=faces&dpr=1&w=525")
    @comedian_3 = Comedian.create!(name: "Louis C.K.", age: 51, birthplace: "Washington, D.C.", image_url: "http://www.brooklynvegan.com/files/2016/09/Louis-CK-Oh-My-God.jpg")
    @special_1 = @comedian_1.specials.create(name: "Obsessed", running_time: 60)
    @special_2 = @comedian_1.specials.create(name: "Cinco", running_time: 73)
    @special_3 = @comedian_1.specials.create(name: "Noble Ape", running_time: 90)
    @special_4 = @comedian_2.specials.create(name: "Killin' Them Softly", running_time: 57)
    @special_5 = @comedian_2.specials.create(name: "For What It's Worth", running_time: 60)
    @special_6 = @comedian_2.specials.create(name: "Equanimity", running_time: 60)
    @special_7 = @comedian_3.specials.create(name: "Chewed Up", running_time: 71)
    @special_8 = @comedian_3.specials.create(name: "Hilarious", running_time: 82)
    @special_9 = @comedian_3.specials.create(name: "Live at the Beacon Theater", running_time: 62)
  end

  describe "I visit `/comedians`" do
    it "then I see a list of comedians and their attributes" do

      visit "/comedians"

      expect(page).to have_content(@comedian_1.name)
      expect(page).to have_content(@comedian_1.age)
      expect(page).to have_content(@comedian_1.birthplace)

      expect(page).to have_content(@comedian_2.name)
      expect(page).to have_content(@comedian_2.age)
      expect(page).to have_content(@comedian_2.birthplace)
    end
  end

  describe "I visit `/comedians`" do
    it "then I also see a list of each comedian's specials" do

      visit "/comedians"

      expect(page).to have_content(@comedian_1.name)
      expect(page).to have_content(@comedian_1.age)
      expect(page).to have_content(@comedian_1.birthplace)
      expect(page).to have_content(@special_1.name)
      expect(page).to have_content(@special_1.running_time)
      expect(page).to have_content(@special_2.name)
      expect(page).to have_content(@special_2.running_time)
      expect(page).to have_content(@special_3.name)
      expect(page).to have_content(@special_3.running_time)
    end
  end

  describe "I visit `/comedians`" do
    it "then I also see a thumbnail image for each comedian" do

      visit "/comedians"

      expect(page).to have_css("img[src='#{@comedian_1.image_url}']")
    end
  end

  describe "I visit `/comedians?age=52`" do
    it "then I see the list of comedians on the page only shows comedians who match the age criteria" do

      visit "/comedians?age=#{@comedian_1.age}"

      expect(page).to have_content(@comedian_1.name)
      expect(page).to have_content(@comedian_1.age)
      expect(page).to have_content(@comedian_1.birthplace)
      expect(page).to have_css("img[src='#{@comedian_1.image_url}']")
      expect(page).to_not have_content(@comedian_2.name)
      expect(page).to_not have_content(@comedian_2.age)
      expect(page).to_not have_content(@comedian_2.birthplace)
      expect(page).to_not have_css("img[src='#{@comedian_2.image_url}']")
    end
  end

  describe "I visit `/comedians`" do
    it "then I also see a count of their TV specials" do

      visit "/comedians"

      expect(@comedian_1.specials_count).to eq(3)
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

        visit "/comedians"

        expect(page).to have_content(@comedian_1.name)
        expect(page).to have_content(@comedian_2.age)
        expect(page).to have_content(@comedian_3.birthplace)
        expect(page).to have_content("Statistics")
        expect(page).to have_content("Average age")
        expect(Comedian.avg_age.to_f.round(1)).to eq(49.3)
        expect(Comedian.locations.sort).to eq(["Elgin, IL", "Washington, D.C."])
      end
    end
  end

  describe "I visit `/comedians`" do
    describe "I see a link to a page that only shows
that comedian's information and TV specials" do
      it "when I click the link" do

        visit comedians_path

        click_link @comedian_1.name

        expect(page).to have_content(@comedian_1.name)
        expect(page).to have_content(@comedian_1.age)
        expect(page).to have_content(@comedian_1.birthplace)
      end
    end
  end
end
