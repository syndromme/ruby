class UsersController < ApplicationController
  def new
    @user = User.new
  end
   
  def create
    @user = User.new(params[:user])
    if verify_recaptcha
      if @user.save
        redirect_to root_url, :notice => "Sign Up !"
        UserMailer.registration_confirmation(@user).deliver
      else
        render "new"
      end
    else
      flash[:error] = "There was an error with the recaptcha code below.
                      Please re-enter the code and click submit."
     render "new"
    end
  end
end
