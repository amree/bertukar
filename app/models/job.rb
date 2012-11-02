class Job < ActiveRecord::Base
  has_many   :next_jobs, foreign_key: :current_job_id, class_name: "Job"
  belongs_to :current_job, class_name: "Job"
  belongs_to :user
  belongs_to :location
  belongs_to :ministry

  scope :main, where("current_job_id IS NULL")

  accepts_nested_attributes_for :next_jobs, reject_if: :all_blank, allow_destroy: true

  validates :user, presence: true
  validates :location, presence: true
  validates :ministry, presence: true, if: "is_current_job?"

  validates :jawatan, presence: true
  validates :gred, presence: true
  validates :gred, format: { with: /^[A-Z][1-54]+/ }, unless: "gred.blank?"
  validates :nama_organisasi, presence: true, if: "is_current_job?"
  validates :location_id, uniqueness: { scope: :current_job_id }, if: "is_next_job?"

  validate :must_have_next_job, if: "is_current_job?"

  before_validation :populate_fields

  auto_strip_attributes :jawatan, squish: true
  auto_strip_attributes :gred, squish: true
  auto_strip_attributes :nota, squish: true
  auto_strip_attributes :nama_organisasi, squish: true

  def is_current_job?
    self.current_job_id.blank?
  end

  def is_next_job?
    !self.current_job_id.blank?
  end

  def get_state
    unless location_id.nil?
      location = Location.find(location_id)
      unless location.state_id.nil?
        return location.state_id
      else
        return location_id
      end
    end
  end

  protected

  def populate_fields
    next_jobs.each do |next_job|
      next_job.user_id = user_id
      next_job.jawatan = jawatan
      next_job.gred = gred
    end
  end

  def must_have_next_job
    if self.next_jobs.blank?
      errors.add(:base, "must choose new job placement for job exchange")
    end
  end
end
