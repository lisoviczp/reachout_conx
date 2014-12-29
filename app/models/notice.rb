class Notice < ActiveRecord::Base
	belongs_to :apartment
	belongs_to :tenant
	belongs_to :landlord
end
