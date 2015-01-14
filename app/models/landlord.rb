class Landlord < ActiveRecord::Base

  # attr_accessor :first_name, :last_name, :phone_number
  validates :first_name, presence: true
  validates :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :buildings
  has_many :apartments
  has_many :tenants
  has_many :notices

  has_many :connections
  
  def full_name 
    "#{first_name} #{last_name}"
  end


end
