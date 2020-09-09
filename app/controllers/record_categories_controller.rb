class RecordCategoriesController < ApplicationController
  before_action :set_pet_id
  def index
    @record_categories = @pet.record_categories
  end

  def new
    @record_category = RecordCategory.new
  end

  private

  def set_pet_id
    @pet = Pet.find(params[:pet_id])
  end
end
