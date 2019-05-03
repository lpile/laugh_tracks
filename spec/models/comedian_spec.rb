require "rails_helper"

RSpec.describe Comedian, type: :model do
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

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:birthplace)}
    it {should validate_presence_of(:image_url)}
  end

  describe "relationships" do
    it {should have_many(:specials)}
  end

  describe "class methods" do
    it '.by_age' do
      expect(Comedian.by_age(52)).to eq([@comedian_1])
    end

    it '.avg_age' do
      expect(Comedian.avg_age.to_f.round(1)).to eq(49.3)
    end

    it '.locations' do
      expect(Comedian.locations).to eq(["Elgin, IL", "Washington, D.C."])
    end

    it '.count_of_specials' do
      expect(Comedian.count_of_specials).to eq(9)
    end

    it '.average_of_specials' do
      expect(Comedian.average_of_specials.to_f.round(1)).to eq(68.3)
    end
  end

  describe 'instance methods' do
    it '.specials_count' do
      expect(@comedian_1.specials_count).to eq(3)
    end
  end
end
