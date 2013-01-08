class Profile < ActiveRecord::Base
   attr_accessible :tel, :school, :qq, :sex, :user_id
   belongs_to :user
end
