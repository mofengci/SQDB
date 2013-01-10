module ResultHelper

  def find_user (id)
  	if id!=0
    	@user=User.find(id)
    	@user.name
    end
  end
	
	def putin_table(per,res,pos)
		if (res.id==per.dutytime.dutytime_0||res.id==per.dutytime.dutytime_1||res.id==per.dutytime.dutytime_2||res.id==per.dutytime.dutytime_3)
			if pos=="male"
				if res.male1==0
					res.male1=per.id
				elsif res.male2==0
					res.male2=per.id
				elsif per.property.priority>User.find(res.male1).property.priority
					res.male1=per.id
					per.property.priority-=1
					User.find(res.male1).property.priority+=1
				elsif per.property.priority>User.find(res.male2).property.priority
					res.male2=per.id
					per.property.priority=1
					User.find(res.male2).property.priority+=1
				else
					per.property.priority+=1
				end	
        per.property.save			
			elsif pos=="manager"
				if res.manager==0
					res.manager=per.id
				elsif per.property.priority>User.find(res.manager).property.priority
					res.manager=per.id
					User.find(res.manager).property.priority+=1
					per.property.priority-=1
				elsif per.property.priority<=User.find(res.manager).property.priority
					per.property.priority+=1
				end
        per.property.save
			elsif pos=="coach"
				if res.coach==0
					res.coach=per.id
				elsif per.property.priority>User.find(res.coach).property.priority
					res.coach=per.id
					User.find(res.coach).property.priority+=1
					per.property.priority-=1
				elsif per.property.priority<=User.find(res.coach).property.priority
					per.property.priority+=1
				end
        per.property.save
			elsif pos=="female"
				if res.female==0
					res.female=per.id
				elsif per.property.priority>User.find(res.female).property.priority
					res.female=per.id
					User.find(res.female).property.priority+=1
					per.property.priority-=1
				elsif per.property.priority<=User.find(res.female).property.priority
					per.property.priority+=1
				end
        per.property.save
			end
		end
	end

	def render_result
		@users=User.all
		#清空所有排班信息
		if !Result.all.any?
			(1..14).to_a.each do |i|
				@result=Result.new
				@result.manager=0
				@result.coach=0
				@result.female=0
				@result.male1=0
				@result.male2=0
				@result.save
			end
		end
		(1..14).to_a.each do |i|
			@result=Result.find(i)
			@result.manager=0
			@result.coach=0
			@result.female=0
			@result.male1=0
			@result.male2=0
			@result.save
		end
		#优先级预处理，提交排班申请较少的优先级高
		@users.each do |person|
			if person.dutytime.dutytime_0==0
				person.property.priority+=1
			end
			if person.dutytime.dutytime_1==0
				person.property.priority+=1
			end
			if person.dutytime.dutytime_2==0
				person.property.priority+=1
			end
			if person.dutytime.dutytime_3==0
				person.property.priority+=1
			end
      person.property.save
		end
		#重新生成排班信息
		(1..14).to_a.each do |i|
			@result=Result.find(i)
			@users.each do |person|
				putin_table(person,@result,person.property.position) unless person.property.position=="staff"
				putin_table(person,@result,person.profile.sex) if person.property.position=="staff"
			end
			@result.save
		end
	end

end
