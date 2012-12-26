module ResultHelper

  def find_user (id)
    user=User.find(id)
    user.name
  end

end
