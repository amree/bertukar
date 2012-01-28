class Title < ActiveRecord::Base
  validates :nama, uniqueness: true, presence: true
  validates :skim, presence: true
  validates :skim, :format => { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }

  auto_strip_attributes :nama, :skim, squish: true
end
