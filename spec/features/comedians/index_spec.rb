require "rails_helper"

describe "user visit /comedians" do
  describe "user sees list of all comedians" do
    it "displays comedian's attributes" do
      comedian = Comedian.create(name: "Jim Gaffigan", age: 52, birthplace: "Elgin, IL", image_url: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.biography.com%2F.image%2Ft_share%2FMTMxNzMxMzkyOTA3MjIwMjQy%2Fjim_gaffigan_tv_landjpg.jpg&imgrefurl=https%3A%2F%2Fwww.biography.com%2Fnews%2Fjim-gaffigan-biography-interview&docid=BX7V8mX-xBtwaM&tbnid=VqmzN38qijsRjM%3A&vet=10ahUKEwjZt6u76PjhAhXD3J4KHaBzDscQMwh3KA0wDQ..i&w=1200&h=600&bih=723&biw=720&q=jim%20gaffigan&ved=0ahUKEwjZt6u76PjhAhXD3J4KHaBzDscQMwh3KA0wDQ&iact=mrc&uact=8")

      visit '/comedians'

      expect(page).to have_content(comedian.name)
      expect(page).to have_content(comedian.age)
      expect(page).to have_content(comedian.birthplace)
    end
  end
end
