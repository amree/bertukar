class Job < ActiveRecord::Base
  has_many   :next_jobs, class_name: "Job"
  belongs_to :current_job, class_name: "Job"
  belongs_to :user
  belongs_to :location
  belongs_to :title
end
