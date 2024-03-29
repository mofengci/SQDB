class UsersController < ApplicationController
  before_filter :signed_in_user, only:[:index, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  def show
    @user = User.find(params[:id])
    @users= User.all
  end

  def new
    @user=User.new
  end

  def index
    @users=User.all
    @new_user=User.new
  end

  def create
    @user = User.new(params[:user])
    if !User.all.any?
      @user.admin=true
    end
    if @user.save

      @profile=Profile.new
      @profile.user_id=@user.id
      @profile.save

      @dutytime=Dutytime.new
      @dutytime.user_id=@user.id
      @dutytime.save

      @property=Property.new
      @property.user_id=@user.id
      @property.save
      
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @users= User.all
    
  end

  def update
    @user= User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path,notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
