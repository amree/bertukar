class User < ActiveRecord::Base
  has_many :jobs, dependent: :destroy

  scope :latest, order("created_at DESC")

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :terms, :acceptance => true, :on => :create

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :full_name, :phone, :password, :password_confirmation, :remember_me, :terms
end
