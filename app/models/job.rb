class Job < ActiveRecord::Base
  has_many   :next_jobs, foreign_key: :current_job_id, class_name: "Job"
  belongs_to :current_job, class_name: "Job"
  belongs_to :user
  belongs_to :location
  belongs_to :title
  belongs_to :ministry

  scope :main, where("current_ IS NULL")

  accepts_nested_attributes_for :next_jobs, reject_if: :all_blank, allow_destroy: true

  attr_accessor :is_next_job

  before_validation :populate_fields

  validates_presence_of :user
  validates_presence_of :location
  validates_presence_of :title
  validates_presence_of :ministry, if: :is_not_next_job?

  validates :gred, presence: true
  validates :gred, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 54 },
                   unless: "gred.blank?"
  validates :expired_at, presence: true
  validates :nama_organisasi, presence: true, if: :is_not_next_job?

  validate :verify_expired_at, unless: "expired_at.nil?"
  validate :current_job_should_be_blank_for_non_exchange, unless: "is_exchange?"

  auto_strip_attributes :gred, squish: true
  auto_strip_attributes :nota, squish: true
  auto_strip_attributes :nama_organisasi, squish: true

  def is_not_next_job?
    !@is_next_job
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

  def verify_expired_at
    if expired_at < Time.now
      errors.add(:expired_at, "must at least expired tomorrow")
    end

    if expired_at > Time.now + 6.months
      errors.add(:expired_at, "maximum is within 6 months from now")
    end
  end

  def current_job_should_be_blank_for_non_exchange
    unless current_job_id.nil?
      errors.add(:current_job_id, "should not be set")
    end
  end

  def populate_fields
    next_jobs.each do |next_job|
      next_job.user_id = user_id
      next_job.title_id = title_id
      next_job.gred = gred
      next_job.expired_at = expired_at
      next_job.is_exchange = true
      next_job.is_next_job = true
    end
  end
end
