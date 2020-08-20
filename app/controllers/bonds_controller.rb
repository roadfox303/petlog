class BondsController < ApplicationController
  def create
    binding.pry
    # bons = current_user.bons.find_or_create_by(pet_id: params[:pet_id])
    # redirect_to user_path(current_user), notice: 'Nice!しました'
  end

  def destroy
    # back = Nice.find(params[:id]).blog_id
    # nice = current_user.nices.find_by(id: params[:id]).destroy
    # redirect_to blog_path(back), notice: 'Nice!を取り消しました'
  end
end
