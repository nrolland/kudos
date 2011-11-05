class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.find_by_email(params[:session][:email])

    if (user && user.authenticate(params[:session][:password]))
      session[:user_id] = user.id

      flash.now[:success] = "User logged: #{user.name}"
      render 'new'
    else
      flash.now[:error] = "Invalid user"
      render 'new'
    end
  end

  def destroy

  end
end
