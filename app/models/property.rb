class Property < ActiveRecord::Base
   attr_accessible :position, :ispoor,:priority
   belongs_to :user 
end
