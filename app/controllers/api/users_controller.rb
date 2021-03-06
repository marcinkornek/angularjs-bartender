class Api::UsersController < ApplicationController
  before_action :current_user?, only:   [:update, :destroy]
  before_action :require_login, except: [:create, :activate, :show, :check_if_unique]
  before_action :check_if_admin, except: [:create, :activate, :show, :update, :avatar_upload, :check_if_unique]

  def index
    @users = User.all.order(created_at: :desc).extend(ListUsersRepresenter).paginate(:page => params[:page], :per_page => 10)
    @users_number = User.all.count
    render json: {users: @users.to_hash, number: @users_number}
  end

  def create
    @user = User.new(user_create_params)
    user.send_activation_email = true
    if @user.save
      @user = User.find(@user.id)
      @user.extend(ListUserRepresenter)
      render json: {user: @user.to_hash}
    else
      render json: @user.errors, status: :not_acceptable
    end
  end

  def show
    show_user = if current_user.role == 'Admin'
      user.extend(UserRepresenter)
    else
      current_user.extend(UserRepresenter)
    end
    render json: show_user
  end

  def avatar_upload
    if current_user.update_attributes(avatar: params[:file])
      render json: current_user.extend(UserRepresenter)
    else
      render json: current_user.errors, status: :not_acceptable
    end
  end

  def update
    if user.update_attributes(user_params)
      render json: user.extend(UserRepresenter)
    else
      render json: user.errors, status: :not_acceptable
    end
  end

  def destroy
    render json: user.destroy
  end

  def check_if_unique
    if User.where(params['key'] => params['value']).exists?
      render json: {error: 'unique: false'}, status: :not_acceptable
    else
      render json: {unique: true}
    end
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to root_path(:anchor => '/session/new')
    else
      not_authenticated
    end
  end

  ###################################################

  private

  def user_params
    params.permit(:username, :email, :avatar)
  end

  def user_create_params
    params.permit(:username, :email, :password, :password_confirmation, :provider, :uid, :friendly_token)
  end

  def user
    @user ||= User.find(params[:id])
  end

  def current_user?
    unless current_user == user
      render json: {error: 'unpermited user'}, status: :not_acceptable
    end
  end

end

