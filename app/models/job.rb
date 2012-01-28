class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  JENIS = ["KOSONG", "SUKA SAMA SUKA"]
end
