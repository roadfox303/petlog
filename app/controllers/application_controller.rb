class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :current_user
  helper_method :category_follower
  helper_method :category_former
  helper_method :category_family
  helper_method :category_owner
  before_action :login_required

  def generate_form_select(hash, key)
    hash.map { |item| [item[key], (item[:id])] }
  end

  def check_owner?
    @pet.owner == current_user
  end

  def check_pet_id(pet_id)
    pet_id.to_i == session[:pet_id]
  end

  # def check_record_category_id(record_category_id)
  #   record_category_id.to_i == session[:record_category_id]
  # end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end

end
