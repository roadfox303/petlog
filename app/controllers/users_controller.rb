class UsersController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]
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
      redirect_to users_path, notice: "「#{@user.name}」でユーザー登録しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update!(user_params)
      redirect_to user_path(current_user), notice: "「#{@user.name}」のプロフィールを編集しました"
    else
      render :edit, notice: "「#{@user.name}」のプロフィールを編集できませんでした"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :comment, :password, :password_confirmation)
  end

  def set_id
    @user = User.find(params[:id])
  end
end
