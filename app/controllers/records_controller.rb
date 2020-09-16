class RecordsController < ApplicationController
  before_action :set_pet_id
  before_action :set_content_id

  def new
    @categories = @pet.record_categories.includes(:icon).all
    @record = @content.records.new
  end

  def create
    @record = @content.records.build(record_params)
    if @record.save
      redirect_to pet_contents_path(@pet), notice: "#{l @record.created_at, format: :long} に「#{@record.record_category.title}」を記録しました"
    end
  end

  def destroy
    @record = Record.find_by(id: params[:id])
    if @record.destroy
      redirect_to pet_contents_path(@pet), notice: "#{l @record.created_at, format: :long} の「#{@record.record_category.title}」を削除しました"
    else
      redirect_to pet_contents_path(@pet), alert: "ログスタンプ「#{@record.record_category.title}」を削除できませんでした"
    end
  end

  private

  def record_params
    params.require(:record).permit(:record_category_id, :memo).merge(user_id: current_user.id)
  end

  def set_pet_id
    @pet = Pet.find(params[:pet_id])
  end

  def set_content_id
    @content = @pet.contents.find_or_initialize_by(have_on: Date.today)
  end
end
