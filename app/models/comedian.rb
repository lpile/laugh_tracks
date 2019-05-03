class Comedian < ApplicationRecord
  validates_presence_of :name, :age, :birthplace, :image_url

  has_many :specials

  def specials_count
    specials.count(:id)
  end

  def self.by_age(age)
    where(age: age)
  end

  def self.avg_age
    average(:age)
  end

  def self.locations
    group(:birthplace).order(:birthplace).pluck(:birthplace)
  end
end
