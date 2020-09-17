class PetsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]
  before_action :params_modifi, only: [:create, :update]
  include BondGenerate

  def index
    @pets = Pet.all.includes(:owner, :bonds).page(params[:page])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      PetsController.bond_create(user_id: current_user.id, pet_id: @pet.id, relation_category_id: 4)
      generate_record_category_preset
      redirect_to users_path, notice: "オーナーとして「#{@pet.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    redirect_to pet_path(@pet) unless pet_owner?
  end

  def update
    unless pet_owner?
      render :edit, alert: "「#{@pet.name}」の編集はできません"
    end

    if @pet.update(pet_params)
      redirect_to pet_path(@pet), notice: "「#{@pet.name}」のプロフィールを編集しました"
    else
      render :edit
    end
  end

  def show
    @familys = @pet.family_users
    @followers = @pet.follower_users
    @owner = @pet.owner
    @bond = current_user.bonds.find_by(pet_id: @pet) unless current_user == @owner
  end

  def destroy
    if pet_owner?
      @pet.destroy
      redirect_to user_path(current_user), notice: "ペット「#{@pet.name}」を削除しました"
    else
      render pet_path(@pet), alert: "「#{@pet.name}」を削除する権限がありません"
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :species, :sex, :birthday, :join_day, :join_age, :comment, :intrust, :user_id,
      :image_x,
      :image_y,
      :image_w,
      :image_h,
      :avatar,)
  end

  def set_id
    @pet = Pet.find(params[:id])
    session[:pet] = @pet.id
  end

  def params_modifi
    params[:pet][:birthday] = date_join(params[:birthday])
    params[:pet][:join_day] = date_join(params[:join_day])
  end

  def date_join(date)
    date.values.map { |value| return if value.empty? }
    Date.new date.values[0].to_i, date.values[1].to_i, date.values[2].to_i
  end

  def pet_owner?
    @pet.check_pet_owner(current_user)
  end

  def generate_record_category_preset
    @pet.record_categories.create [
      { title: '病院', icon_id:23},
      { title: 'くすり', description:'処方薬', icon_id:16},
      { title: '爪切り', icon_id:18},
      { title: 'おふろ', description:'シャワー', icon_id:17},
      { title: 'さんぽ', description:'普段のコース', icon_id:12},
      { title: 'ごはん', description:'ペットフード', icon_id:10},
    ]
  end
end
