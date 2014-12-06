class Tenant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :landlord
  belongs_to :building
  belongs_to :apartment



  def full_name 
  	first_name + " " + last_name
  end
  
end
