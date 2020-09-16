class RecordCategoriesController < ApplicationController
  before_action :set_pet_id
  before_action :pet_famiry?
  before_action :load_icons
  def index
    @pet = Pet.find(params[:pet_id])
    session[:pet_id] = @pet.id
    @record_categories = @pet.record_categories.includes(:icon).order(updated_at: "DESC")
  end

  def new
    session[:pet_id] = @pet.id
    @record_category = RecordCategory.new(pet_id: @pet.id)
  end

  def create
    unless check_pet_id(record_category_params[:pet_id])
      redirect_to pet_path(session[:pet_id])
    end
    @record_category = RecordCategory.new(record_category_params)
    if @record_category.save
      redirect_to pet_record_categories_path, notice: "ログスタンプカテゴリ「#{@record_category.title}」を作成しました"
    else
      @pet = Pet.find(params[:pet_id])
      render :new, id: params[:id], notice: "ログスタンプカテゴリ「#{@record_category.title}」を作成できませんでした"
    end
  end

  def edit
    @record_category = RecordCategory.find_by(id: params[:id], pet_id: @pet.id)
    session[:pet_id] = @pet.id
    session[:record_category_id] = @record_category.id
  end

  def update
    unless check_pet_id(record_category_params[:pet_id])
      redirect_to pet_path(session[:pet_id]), alert: "ログスタンプカテゴリ作成の失敗。ペットIDが不正な値です。"
    end
    @record_category = RecordCategory.find_by(id: params[:id])
    if @record_category.update(record_category_params)
      redirect_to pet_record_categories_path, notice: "ログスタンプカテゴリ「#{@record_category.title}」を編集しました"
    else
      @pet = Pet.find(params[:pet_id])
      render :edit, id: params[:id]
    end
  end

  def destroy
    unless check_pet_id(params[:pet_id])
      redirect_to pet_path(session[:pet_id]), alert: "ログスタンプカテゴリ作成の失敗。ペットIDが不正な値です。"
    end
    @record_category = RecordCategory.find_by(id: params[:id])
    if @record_category.destroy
      redirect_to pet_record_categories_path, notice: "ログスタンプカテゴリ「#{@record_category.title}」を削除しました"
    else
      @pet = Pet.find(params[:pet_id])
      render :edit, id: params[:id]
    end
  end

  private

  def record_category_params
    params.require(:record_category).permit(:id, :title, :description, :icon_id, :pet_id)
  end

  def set_pet_id
    @pet = Pet.find(params[:pet_id])
  end

  def pet_famiry?
    redirect_to pet_path(@pet) unless @pet.check_pet_famiry(current_user)
  end

  # def check_record_category_id(record_category_id)
  #   record_category_id.to_i == session[:record_category_id]
  # end

  def load_icons
    @all_icons = Icon.all.order(id: "ASC")
    @care_icons = IconCare.all.order(id: "ASC")
    @event_icons = IconEvent.all.order(id: "ASC")
    @emotion_icons = IconEmotion.all.order(id: "ASC")
    @animal_icons = IconAnimal.all.order(id: "ASC")
  end
end
