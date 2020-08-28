class RelationshipsController < ApplicationController
  def create
    @user = User.find(relationship_params[:followed_id])
    current_user.follow!(@user)
    redirect_to user_path(@user), notice: "「#{@user.name}」をフォローしました"
  end

  def destroy
    @user = Relationship.find(relationship_params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to user_path(@user), notice: "「#{@user.name}」のフォローを解除しました"
  end

  def relationship_params
    params.permit(:id, :follower_id, :followed_id, :relation_category_id)
  end
end
