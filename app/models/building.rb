class Building < ActiveRecord::Base
	belongs_to :landlord
	has_many :apartments
	has_many :tenants


	def building_name
		zip = zipcode.to_s
		(address + " " + city + ", " + state + " " + zip)
	end

end
