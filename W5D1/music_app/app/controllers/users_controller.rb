class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to bands_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    redirect_to new_session_url unless logged_in? && current_user.id = params[:id]

    @user = User.find(params[:id])

    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
