class Tenant < ActiveRecord::Base
  # attr_accessor :first_name, :last_name, :phone_number
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :landlord
  belongs_to :building
  belongs_to :apartment

  has_many :notices

  belongs_to :connection
  
  def full_name 
    "#{first_name} #{last_name}"
  end

  def landlord_name
    landlord.try(:full_name)
  end

  def landlord_name=(name)
    # binding.pry
    split_name=name.split(' ')
    first=split_name[0]
    last=split_name[1]
    self.landlord = Landlord.find_or_create_by(first_name: first, last_name: last) if name.present?
    # self.building =Building.where(address: address).first_or_create
  end
  
end
