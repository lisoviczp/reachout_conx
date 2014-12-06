class Apartment < ActiveRecord::Base
	belongs_to :landlord
	belongs_to :building
	has_many :tenants

	def apartment_name
		building.building_name + ": Apartment " + apartment_number
	end

	
end
