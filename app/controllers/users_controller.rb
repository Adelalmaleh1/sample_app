class UsersController < ApplicationController
	def index 
		@users= User.all
		
	end
	
  def show
  	@user = User.find(params[:id])
  end
  def follow
  	@user = User.find(params[:id])
   
  	if current_user
    	current_user.follow(@user)
    	flash[:notice] = "You are now following #{@user.first_name}"
    	redirect_to :back
    end
  end
  def unfollow
  	@user = User.find(params[:id])
    
  
  	if current_user
	  	current_user.stop_following(@user)
	  	flash[:notice] = "you ae no longer following #{@user.first_name}"
	  	redirect_to :back
	  end
  end
  def following
    @users = user.all_following
  end
end
