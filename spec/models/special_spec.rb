require "rails_helper"

describe Special, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:running_time)}
  end

  describe 'relationships' do
    it {should belong_to :comedian}
  end

  describe 'class methods' do
    it '.special_count' do
      comedian = Comedian.create!(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://media.timeout.com/images/103872088/1372/772/image.jpg")
      special_1 = comedian.specials.create(name: "Obsessed", running_time: 60)
      special_2 = comedian.specials.create(name: "Cinco", running_time: 73)
      special_3 = comedian.specials.create(name: "Noble Ape", running_time: 90)

      expect(Special.special_count).to eq(3)
    end
  end
end
