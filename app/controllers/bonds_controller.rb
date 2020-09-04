class BondsController < ApplicationController
  def create
    if more_upper_relation?
      redirect_to pet_path(bond_params[:pet_id]), notice: '既にフォローされています'
    else
      current_user.bonds.find_or_create_by(bond_params)
      redirect_to pet_path(bond_params[:pet_id]), notice: 'フォローしました'
    end
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

  def more_upper_relation?
    relation = current_user.bonds.find_by(pet_id: bond_params[:pet_id],user_id: bond_params[:user_id])
    if relation && relation_category_id > 1
      true
    else
      false
    end
  end
end
