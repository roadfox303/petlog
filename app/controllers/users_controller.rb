class UsersController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy, :follower, :following]
  skip_before_action :login_required, only: [:index, :new, :create, :show ]

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
      redirect_to user_path(@user), notice: "「#{@user.name}」でユーザー登録しました"
    else
      render :new
    end
  end

  def show
    @followers = @user.followers
    @followings = @user.followings
    @family_pets = @user.family_pets.order(id: "ASC")
    # @follow_pets = @user.follow_pets.order(id: "DESC")
    @follow_pets = @user.follow_pets.includes(pet: :owner).order(id: "DESC")
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
      render :edit, alert: "「#{@user.name}」のプロフィールを編集できませんでした"
    end
  end

  def follower
    @followers = @user.follower_users
    @mutual_relationships = (current_user.following_users & current_user.follower_users).map do |user|
      [user.id, user.relation_category]
    end
  end

  def following
    @followings = @user.following_users
    @mutual_relationships = (current_user.follower_users & current_user.following_users).map do |user|
      [user.id, user.relation_category]
    end
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
