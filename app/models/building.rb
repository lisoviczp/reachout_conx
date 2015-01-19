class Building < ActiveRecord::Base
	belongs_to :landlord
	has_many :apartments
	has_many :tenants

	has_one :detail

	def building_name
		zip = zipcode.to_s
		if zip.length == 4
			zip='0'+zip
		end
		(address + " " + city + ", " + state + " " + zip)
	end

end
