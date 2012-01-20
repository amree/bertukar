class Location < ActiveRecord::Base
  belongs_to :state, class_name: "Location", foreign_key: :state_id
  has_many :districts, class_name: "Location", foreign_key: :state_id

  validates :nama, presence: true
  validates :nama, uniqueness: { scope: :state_id }
  validates_presence_of :state, unless: "state_id.nil?"

  auto_strip_attributes :nama, squish: true
end
