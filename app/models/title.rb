class Title < ActiveRecord::Base
  validates :nama, uniqueness: true, presence: true
  validates :skim, presence: true
  validates :skim, format: { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }
  validates :skim, length: { minimum: 1, maximum: 2 }

  auto_strip_attributes :nama, :skim, squish: true
end
