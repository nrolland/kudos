class KudosController < ApplicationController
  before_filter :authenticate

  def new
    @kudo = Kudo.new
    @users = current_user.group.users
  end

  def create
    @users = current_user.group.users
    user = User.find(params[:kudo][:to])

    if user.nil? and params[:kudo]
      flash.now[:error] = "That user doesn't exists"
      render :new
    else
      @kudo = Kudo.create(
        :from => current_user,
        :to => user,
        :season => current_season,
        :message => params[:kudo][:message]
      )

      if @kudo.save
        redirect_to @kudo, :notice => "Kudo created"
      else
        flash.now[:error] = "Could not create Kudo"
        render :new
      end
    end
  end

  def show
    if params[:id]
      @kudo = Kudo.find(params[:id])
    else
      flash[:errors].add "Can't find that Kudo"
      redirect_to timeline_path
    end
  end

end
