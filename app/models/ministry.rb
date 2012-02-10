class Ministry < ActiveRecord::Base
  validates :nama, uniqueness: true, presence: true

  auto_strip_attributes :nama, squish: true
end
