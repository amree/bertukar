class Title < ActiveRecord::Base
  validates :nama, uniqueness: true, presence: true
  validates :skim, presence: true
  validates :skim, format: { :with => /\A[a-zA-Z]+\z/, :message => "Only letters allowed" }
  validates :skim, length: { minimum: 1, maximum: 2 }

  before_save :titleize_nama
  before_save :upcase_skim

  auto_strip_attributes :nama, :skim, squish: true

  protected

  def titleize_nama
    self.nama = self.nama.titleize
  end

  def upcase_skim
    self.skim = self.skim.upcase
  end
end
