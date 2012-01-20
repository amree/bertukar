class Location < ActiveRecord::Base
  belongs_to :state, class_name: "Location", foreign_key: :state_id
  has_many :districts, class_name: "Location", foreign_key: :state_id
end
