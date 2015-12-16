class SessionsController < ApplicationController
  def new
    
  end

  def create
    # ex user.authenticate('password')
    #1. get user obj
    #2. see if password match
    #3. if so, login
    #4. if not , error message

    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You've logged in! "
      redirect_to root_path

    else
      flash[:error] = 'Something went worng with your username or password'
      redirect_to register_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out!"
    redirect_to root_path
  end
end