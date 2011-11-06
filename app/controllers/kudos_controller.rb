class KudosController < ApplicationController
  before_filter :authenticate

  def new
    @kudo = Kudo.new
    @users = current_user.group.users
  end

  def create
    @users = current_user.group.users
    user = User.find(params[:kudo][:to])
    season = current_season

    if user.nil?
      flash.now[:error] = "That user doesn't exists"
      render :new
    else
      @kudo = Kudo.new(
          params[:kudo].merge(
            :from => current_user,
            :to => user,
            :season => season))

      if @kudo.save
        redirect_to signup_path, :notice => "Kudo created"
      else
        flash.now[:error] = "Could not create Kudo"
        render :new
      end
    end
  end

end
