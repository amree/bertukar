class Ministry < ActiveRecord::Base
  validates :nama, uniqueness: true, presence: true

  before_save :titleize_nama

  auto_strip_attributes :nama, squish: true

  protected

  def titleize_nama
    self.nama = self.nama.titleize
  end
end
