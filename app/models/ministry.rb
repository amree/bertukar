class Ministry < ActiveRecord::Base
  has_many :jobs

  validates :nama, uniqueness: true, presence: true

  before_save :titleize_nama
  before_destroy :make_sure_unused

  auto_strip_attributes :nama, squish: true

  attr_accessible :nama, :is_aktif

  protected

  def titleize_nama
    self.nama = self.nama.titleize
  end

  def make_sure_unused
    if jobs.length > 0
      errors.add(:base, "Terdapat iklan yang menggunakan kementerian ini.")
      false
    end
  end
end
