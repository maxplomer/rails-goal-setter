class SessionsController < ApplicationController
  def new
    render :new
  end


  def create
    @user = User.find_by_credentials(user_params)
    if @user
      sign_in!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end


  def destroy
    sign_out!
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
