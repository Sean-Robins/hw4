class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by({ "email" => params["email"] })
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Hello."
        redirect_to "/"
      else
        flash["notice"] = "Sorry, that is incorrect. Please re-enter your username and password or sign up."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Sorry, that is incorrect. Please re-enter your username and password or sign up."
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Thank you for visting the site. Goodbye."
    redirect_to "/login"
  end
end
  