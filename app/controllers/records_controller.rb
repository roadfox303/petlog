class RecordsController < ApplicationController
  before_action :set_pet_id
  before_action :set_content_id

  def new
    @categories = @pet.record_categories.includes(:icon).all
    @record = @content.records.new
  end

  def create
    test = @content.records.build(record_params)
    test.save
  end

  def destroy
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
