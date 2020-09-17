class ContentsController < ApplicationController
  before_action :set_pet_id
  before_action :check_family?
  def index
    @content = @pet.contents.find_or_create_by(have_on: Date.today)
    @contents = @pet.contents.includes(:records).includes(:records => :user).all.order(have_on: :DESC).order("records.created_at desc").page(params[:page]).per(30)
  end

  private

  def content_params
    params.require(:content).permit(:have_on,:pet_id)
  end

  def set_pet_id
    @pet = Pet.find(params[:pet_id])
  end

end
