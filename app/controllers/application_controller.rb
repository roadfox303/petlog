class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :current_user
  before_action :login_required

  def generate_form_select(hash, key)
    hash.map { |item| [item[key], (item[:id])] }
  end

  def check_owner?
    @pet.owner == current_user
  end

  def check_family?
    unless @pet.check_pet_famiry(current_user)
      redirect_to pet_path(@pet)
    end
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end

end
