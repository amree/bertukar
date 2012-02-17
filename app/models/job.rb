class Job < ActiveRecord::Base
  has_many   :next_jobs, class_name: "Job"
  belongs_to :current_job, class_name: "Job"
  belongs_to :user
  belongs_to :location
  belongs_to :title

  accepts_nested_attributes_for :next_jobs, reject_if: :all_blank, allow_destroy: true
end
