class Landlord < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :buildings
  has_many :apartments
  has_many :tenants
  
  def full_name 
  	first_name + last_name
  end


end
