class PetsController < ApplicationController
  before_action :owner_check, only: [:edit, :update, :destroy]
  before_action :params_modifi, only:[:create, :update]
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

  private

  def pet_params
    params.require(:pet).permit(:name, :avatar, :species, :sex, :birthday, :join_day, :join_age, :comment, :intrust)
  end

  def params_modifi
    params[:pet][:birthday] = date_join(params[:birthday])
    params[:pet][:join_day] = date_join(params[:join_day])
  end

  def date_join(date)
    date_element = date.keys

    if date[date_element[0]].empty? || date[date_element[1]].empty? || date[date_element[2]].empty?
      return
    end
    Date.new date[date_element[0]].to_i,date[date_element[1]].to_i,date[date_element[2]].to_i

  end

  def owner_check

  end

end
