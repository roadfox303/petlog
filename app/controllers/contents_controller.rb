class ContentsController < ApplicationController
  before_action :set_pet_id
  def index
    @content = @pet.contents.find_or_create_by(have_on: Date.today)
    @contents = @pet.contents.includes(:record).all.order(have_on: "DESC")
  end

  def new
    binding.pry

  end

  def create

  end

  def show
  end

  def create_records
    @content = @pet.contents.find_or_initialize_by(have_on: Date.today)
    # @content = @pet.contents.new(have_on: Date.today)
    @content.records.build
    @categories = @pet.record_categories.includes(:icon).all
  end

  def content_params
    params.require(:content).permit(:have_on,:pet_id)
  end

  def record_params
  params.require(:content).permit(
      :have_on,
      :pet_id,
      records_attributes: [:id,
                        :memo,
                        :content_id,
                        :record_category_id,
                        :user_id]
    ).merge(user_id: current_user.id)
 end

 def set_pet_id
   @pet = Pet.find(params[:pet_id])
 end
end
