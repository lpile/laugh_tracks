class Special < ApplicationRecord
  validates_presence_of :name, :running_time

  belongs_to :comedian
end
