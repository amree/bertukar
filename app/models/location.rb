class Location < ActiveRecord::Base
  belongs_to :state, class_name: "Location", foreign_key: :state_id
  has_many :districts, class_name: "Location", foreign_key: :state_id
  has_many :jobs

  default_scope order(:nama)
  scope :states, where("state_id IS NULL")
  scope :districts, where("state_id IS NOT NULL")

  validates :nama, presence: true
  validates :nama, uniqueness: { scope: :state_id }
  validates :state, presence: true, unless: "state_id.nil?"

  before_destroy :check_districts

  auto_strip_attributes :nama, squish: true

  protected

  def check_districts
    if districts.count > 0
      errors.add(:base, "Terdapat daerah untuk negeri ini")
      false
    end
  end
end
