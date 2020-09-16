class RecordCategoriesController < ApplicationController
  before_action :set_pet_id
  before_action :check_family?
  before_action :load_icons
  def index
    @pet = Pet.find(params[:pet_id])
    @record_categories = @pet.record_categories.includes(:icon).order(updated_at: "DESC")
  end

  def new
    @record_category = @pet.record_categories.new
  end

  def create
    @record_category = @pet.record_categories.new(record_category_params)
    if @record_category.save
      redirect_to pet_record_categories_path, notice: "LOGスタンプカテゴリ「#{@record_category.title}」を作成しました"
    else
      @pet = Pet.find(params[:pet_id])
      render :new, id: params[:id], notice: "LOGスタンプカテゴリ「#{@record_category.title}」を作成できませんでした"
    end
  end

  def edit
    @record_category = @pet.record_categories.find_by(id: params[:id])
  end

  def update
    @record_category = @pet.record_categories.find_by(id: params[:id])
    if @record_category.update(record_category_params)
      redirect_to pet_record_categories_path, notice: "LOGスタンプカテゴリ「#{@record_category.title}」を編集しました"
    else
      @pet = Pet.find(params[:pet_id])
      render :edit, id: params[:id]
    end
  end

  def destroy
    @record_category = @pet.record_categories.find_by(id: params[:id])
    if @record_category.destroy
      redirect_to pet_record_categories_path, notice: "LOGスタンプカテゴリ「#{@record_category.title}」を削除しました"
    else
      @pet = Pet.find(params[:pet_id])
      render :edit, id: params[:id]
    end
  end

  private

  def record_category_params
    params.require(:record_category).permit(:id, :title, :description, :icon_id)
  end

  def set_pet_id
    @pet = Pet.find(params[:pet_id])
  end

  def load_icons
    @all_icons = Icon.all.order(id: "ASC")
    @care_icons = IconCare.all.order(id: "ASC")
    @event_icons = IconEvent.all.order(id: "ASC")
    @emotion_icons = IconEmotion.all.order(id: "ASC")
    @animal_icons = IconAnimal.all.order(id: "ASC")
  end
end
