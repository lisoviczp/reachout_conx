class Apartment < ActiveRecord::Base
	belongs_to :landlord
	belongs_to :building
	has_many :tenants
	has_many :notices

	has_one :connection

	def apartment_name
		building.building_name + ": Apartment " + apartment_number
	end

	def in_building? (building)
		if building_id == building.id 
			true
		else
			false
		end
	end
end
