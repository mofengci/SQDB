module ResultHelper

  def find_user (id)
  	if id!=0
    	@user=User.find(id)
    	@user.name
    end
  end
	
	def putin_table(per,res,pos)
		if (res.id==per.avadutytime_0||res.id==per.avadutytime_1||res.id==per.avadutytime_2||res.id==per.avadutytime_3)
			if pos=="male"
				if res.male1==0
					res.male1=per.id
				elsif res.male2==0
					res.male2=per.id
				elsif per.priority>User.find(res.male1).priority
					res.male1=per.id
					per.priority-=1
					User.find(res.male1).priority+=1
				elsif per.priority>User.find(res.male2).priority
					res.male2=per.id
					per.priority-=1
					User.find(res.male2).priority+=1
				else
					per.priority+=1
				end				
			elsif pos=="manager"
				if res.manager==0
					res.manager=per.id
				elsif per.priority>User.find(res.manager).priority
					res.manager=per.id
					User.find(res.manager).priority+=1
					per.priority-=1
				elsif per.priority<=User.find(res.manager).priority
					per.priority+=1
				end
			elsif pos=="coach"
				if res.coach==0
					res.coach=per.id
				elsif per.priority>User.find(res.coach).priority
					res.coach=per.id
					User.find(res.coach).priority+=1
					per.priority-=1
				elsif per.priority<=User.find(res.coach).priority
					per.priority+=1
				end
			elsif pos=="female"
				if res.female==0
					res.female=per.id
				elsif per.priority>User.find(res.female).priority
					res.female=per.id
					User.find(res.female).priority+=1
					per.priority-=1
				elsif per.priority<=User.find(res.female).priority
					per.priority+=1
				end
			end
		end
	end

	def render_result
		@users=User.all
		#清空所有排班信息
		(1..14).to_a.each do |i|
			@result=Result.find(i)
			@result.manager=0
			@result.coach=0
			@result.female=0
			@result.male1=0
			@result.male2=0
			@result.save
		end
		#重新生成排班信息
		(1..14).to_a.each do |i|
			@result=Result.find(i)
			@users.each do |person|
				putin_table(person,@result,person.position) unless person.position=="staff"
				putin_table(person,@result,person.sex) if person.position=="staff"
			end
			@result.save
		end
	end

end
