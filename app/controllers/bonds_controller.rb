class BondsController < ApplicationController
  def create
    current_user.bonds.find_or_create_by(bond_params)
    redirect_to pet_path(bond_params[:pet_id]), notice: 'フォローしました'
  end

  def destroy
    back = Bond.find(bond_params[:id]).pet_id
    current_user.bonds.find(bond_params[:id]).destroy
    redirect_to pet_path(back), notice: 'フォローを解除しました'
  end

  private

  def bond_params
    params.permit(:id, :pet_id, :user_id, :relation_category_id)
  end
end
