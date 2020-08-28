class UsersController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy, :follower, :following]
  skip_before_action :login_required

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to users_path, notice: "「#{@user.name}」でユーザー登録しました"
    else
      render :new
    end
  end

  def show
    @followers = @user.followers
    @followings = @user.following
    @family_pets = @user.family_pets.order(id: "ASC")
    @follow_pets = @user.follow_pets.order(id: "DESC")
    @authority = auth_user?
  end

  def edit
    redirect_to user_path(@user) unless auth_user?
  end

  def update
    redirect_to user_path(@user) unless auth_user?
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "「#{@user.name}」のプロフィールを編集しました"
    else
      render :edit, notice: "「#{@user.name}」のプロフィールを編集できませんでした"
    end
  end

  def follower
    @followers = @user.followers
  end

  def following
    @followings = @user.following
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :comment, :password, :password_confirmation,
      :image_x,
      :image_y,
      :image_w,
      :image_h,
      :avatar,)
  end

  def set_id
    @user = User.find(params[:id])
  end

  def auth_user?
    @user == current_user
  end
end
