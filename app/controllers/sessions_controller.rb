class SessionsController < ApplicationController
  def new
  
  end

  def create
    # user = User.find_by(email: params[:session][:email].downcase)
    # if user && user.authenticate(params[:session][:password])

    user = User.find_by(email: params[:email].downcase)
  #  byebug
    if user && user.authenticate(params[:password])
      # Log the user in and redirect to the user's show page.
      log_in! user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

    # Logs out the current user. test

    def destroy 
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
    end

end
