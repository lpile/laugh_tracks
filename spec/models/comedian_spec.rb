require "rails_helper"

RSpec.describe Comedian, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:birthplace)}
    it {should validate_presence_of(:image_url)}
  end

  describe "relationships" do
    it {should have_many(:specials)}
  end

  describe 'instance methods' do
    it '.specials_count' do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      special_1 = comedian.specials.create(name: "Obsessed", running_time: 60)
      special_2 = comedian.specials.create(name: "Cinco", running_time: 73)
      special_3 = comedian.specials.create(name: "Noble Ape", running_time: 90)

      expect(comedian.specials_count).to eq(3)
    end
  end
end
