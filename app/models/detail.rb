class Detail < ActiveRecord::Base
	belongs_to :building

    # after_create :defaults

    # def defaults
    # 	self.building = 
    # 	# binding.pry	
    # end
end