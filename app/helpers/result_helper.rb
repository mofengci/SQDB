module ResultHelper

  def find_user (id)
    @user=User.find(id)
    @user.name
  end
	
	def render_result
		@users=User.all
		@results=Result.all
		#清空所有排班信息
		(0..14).to_a.each do |i|
			@result=Result.find(i)
			@result.manager=0
			@result.coach=0
			@result.female=0
			@result.male1=0
			@result.male2=0
			@result.save
		end
		#重新生成排班信息
		(0..14).to_a.each do |i|
			@users.each do |person|
				
			end
		end
	end

end
