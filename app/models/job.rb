class Job < ActiveRecord::Base
  has_many   :next_jobs, foreign_key: :current_job_id, class_name: "Job", dependent: :destroy
  belongs_to :current_job, class_name: "Job"
  belongs_to :user
  belongs_to :location
  belongs_to :ministry

  scope :main, where("current_job_id IS NULL")
  scope :latest, order("updated_at DESC")

  accepts_nested_attributes_for :next_jobs, reject_if: :all_blank, allow_destroy: true

  validates :user, presence: true
  validates :location, presence: true
  validates :ministry, presence: true, unless: "is_next_job?"

  validates :jawatan, presence: true, unless: "is_next_job?"
  validates :gred, presence: true, unless: "is_next_job?"
  validates :gred, format: { with: /^[A-Z]+([0-9]|[0-4][0-9]|[5][0-4])$/ }, unless: "gred.blank?"
  validates :nama_organisasi, presence: true, unless: "is_next_job?"

  validate :must_have_next_job, unless: "is_next_job?"
  validate :location_must_not_be_state, unless: "location_id.blank?"

  before_validation :populate_fields
  before_validation :ensure_no_duplicated_locations

  auto_strip_attributes :jawatan, squish: true
  auto_strip_attributes :gred, squish: true
  auto_strip_attributes :nota, squish: true
  auto_strip_attributes :nama_organisasi, squish: true

  attr_accessor :is_next_job
  attr_accessible :current_job_id, :location_id, :ministry_id, :jawatan, :gred, :nota, :nama_organisasi,
                  :next_jobs_attributes

  def to_param
    "#{id}-#{gred}-#{location.nama}".downcase.gsub(/[^[:alnum:]]/, '-')
  end

  def is_current_job?
    self.current_job_id.blank?
  end

  def is_next_job?
    !self.current_job_id.nil? || self.is_next_job
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

  def self.search(params)
    if params[:location].blank?
      where('gred LIKE ?', "%#{params[:gred]}%")
    else
      joins(location: :state)
      .where('gred LIKE ?', "%#{params[:gred]}%")
      .where('states_locations.id = ?', params[:location])
    end
  end

  protected

  def populate_fields
    next_jobs.each do |next_job|
      next_job.user_id = user_id
      next_job.is_next_job = true
    end
  end

  def ensure_no_duplicated_locations
    locs = Array.new
    next_jobs.each do |next_job|
      if locs.include?next_job.location_id
        errors.add(:base, "Pastikan anda tidak memilih penempatan akan datang yang sama.")
      else
        locs << next_job.location_id
      end
    end
  end

  def must_have_next_job
    if self.next_jobs.blank?
      errors.add(:base, "must choose new job placement for job exchange")
    end
  end

  def location_must_not_be_state
    if Location.find_by_id(self.location_id).try(:state).nil?
      errors.add(:base, "must not be a state")
    end
  end
end
