class Dutytime < ActiveRecord::Base
   attr_accessible :dutytime_0, :dutytime_1, :dutytime_2, :dutytime_3, :user_id
   belongs_to :user
end
