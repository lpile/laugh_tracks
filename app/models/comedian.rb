class Comedian < ApplicationRecord
  validates_presence_of :name, :age, :birthplace, :image_url

  has_many :specials

  def specials_count
    specials.count(:id)
  end
end
