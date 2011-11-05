class SessionsController < ApplicationController
 
  def new
    @title = "Sign in"
  end

  def create
    user =User.find_by_email(params[:session][:email])
    if (user && user.authenticate(params[:session][:password])) 
      flash.now[:success] = "User logged: #{user.name}"
      sign_in(user)
      redirect_back_or timeline_url
    else
      flash.now[:error]="Invalid user"
      render 'new'  
    end

  end

  def destroy
    sign_out
    redirect_to root_path
  end
    
end
