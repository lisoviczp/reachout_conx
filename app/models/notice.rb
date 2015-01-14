class Notice < ActiveRecord::Base
	belongs_to :apartment
	belongs_to :tenant
	belongs_to :landlord

	def get_time 
		created_at.strftime("%a. %B %e, %Y at %I:%M%P %Z") 
		# created_at.strftime("%a. %B %e, %Y at %I:%M%P %Z") 
	end

end

