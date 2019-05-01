class Special < ApplicationRecord
  validates_presence_of :name, :running_time, :comedian_id
end
