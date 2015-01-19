class Connection < ActiveRecord::Base
	belongs_to :landlord
	has_many :tenants

	belongs_to :apartment

	def apartment_city 
		apartment.building.try(:city)
	end

	def apartment_city=(city)
	    building = Building.find_by(city: city) if city.present?
	    self.apartment = Apartment.find_or_create_by(building: building) if building.present?
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

  def available? 
  	comps = Connection.where(apartment: apartment)
  	comps.all.each do |connection|
		range = start_date.to_i..end_date.to_i
		if range === connection.start_date  || range === connection.end_date
			"False"
		else
			"True"	
		end
  	end
  end

  	def get_start
		start_date.strftime("%B %e, %Y ") 
		# created_at.strftime("%a. %B %e, %Y at %I:%M%P %Z") 
	end

	def get_end
		end_date.strftime("%B %e, %Y ") 
	end

	
end
