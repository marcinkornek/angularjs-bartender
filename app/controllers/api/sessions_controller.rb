class Api::SessionsController < ApplicationController

  def create
    if @user = login(params[:email].downcase, params[:password], params[:remember])
      @user = User.find(@user.id)
      @user.extend(ListUserRepresenter)
      render json: {user: @user.to_hash}
    else
      @user = find_user(params[:email])
      if @user && @user.activation_state != 'active'
        render json: {error: 'Please check your email and activate account'}, status: :not_acceptable
      else
        render json: {error: 'Wrong email/username or password'}, status: :not_acceptable
      end
    end
  end

  def destroy
    logout
    render json: {token: form_authenticity_token}
  end

  def oauth
    user = User.find_for_oauth(request.env["omniauth.auth"])
    auto_login(user)
    redirect_to root_path
  end

  #################

  private

  def find_user(user)
    if @user = User.find_by(email: user)
      @user
    elsif @user = User.find_by(username: user)
      @user
    else
      @user = nil
    end
  end

end
