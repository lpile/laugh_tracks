class Special < ApplicationRecord
  validates_presence_of :name, :running_time

  belongs_to :comedian

  def self.special_count
    count
  end
end
