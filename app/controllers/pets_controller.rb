class PetsController < ApplicationController
  before_action :set_id, only: [:show, :edit, :update, :destroy]
  # before_action :owner_check, only: [:edit, :update, :destroy]
  before_action :params_modifi, only: [:create, :update]
  include BondGenerate

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      PetsController.bond_create(user_id: current_user.id, pet_id: @pet.id, relation_category_id: 4)
      redirect_to users_path, notice: "オーナーとして「#{@pet.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :avatar, :species, :sex, :birthday, :join_day, :join_age, :comment, :intrust, :user_id)
  end

  def set_id
    @pet = Pet.find(params[:id])
  end

  def params_modifi
    params[:pet][:birthday] = date_join(params[:birthday])
    params[:pet][:join_day] = date_join(params[:join_day])
  end

  def date_join(date)
    date.values.map { |value| return if value.empty? }
    Date.new date.values[0].to_i, date.values[1].to_i, date.values[2].to_i
  end

end
