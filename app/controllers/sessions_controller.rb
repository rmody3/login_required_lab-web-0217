class SessionsController < ApplicationController
  before_action :current_user, only: [:create]
  before_action :require_login, only: [:destroy]

  def new
  end

  def create

    if params[:name].blank?
      redirect_to '/login'
    else
      session[:name] = params[:name]
      redirect_to '/'
    end
  end

  def destroy
    session[:name] = nil
    redirect_to '/login'
  end
end
