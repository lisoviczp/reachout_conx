class Connection < ActiveRecord::Base
	belongs_to :landlord
	has_many :tenants

	belongs_to :apartment

	
end
