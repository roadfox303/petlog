class RelationshipsController < ApplicationController
  def create
    @user = User.find(relationship_params[:followed_id])
    current_user.follow!(@user)
    redirect_to user_path(@user), notice: "「#{@user.name}」をフォローしました"
  end

  def update
    if edit_authority
      @relationship = Relationship.find_by(follower_id:relationship_params[:follower_id],  followed_id:relationship_params[:followed_id])
      @relationship.relation_category_id = relationship_params[:relation_category_id]
      if @relationship.save
        mutual_family(current_user, other_user)
        redirect_to user_path(current_user), notice: "「#{other_user.name}」に対し#{relationship_params[:edit_title]}しました"
      else
        redirect_to user_path(current_user), notice: "編集に失敗しました"
      end
    else
      redirect_to user_path(current_user), notice: "編集できません"
    end
  end

  def destroy
    @user = User.find(relationship_params[:followed_id])
    current_user.unfollow!(@user)
    mutual_family(current_user, @user)
    redirect_to user_path(@user), notice: "「#{@user.name}」のフォローを解除しました"
  end

  def relationship_params
    params.permit(:id, :follower_id, :followed_id, :relation_category_id, :edit_title)
  end

  private

  def edit_authority
    relationship_params[:follower_id].to_i == current_user.id || relationship_params[:followed_id].to_i == current_user.id
  end

  def other_user
    if relationship_params[:follower_id].to_i != current_user.id
      User.find(relationship_params[:follower_id])
    else
      User.find(relationship_params[:followed_id])
    end
  end

  def mutual_family(a,b)
    a_follow = Relationship.find_by(follower_id:a, followed_id: b)
    b_follow = Relationship.find_by(follower_id:b, followed_id: a)
    if (a_follow&.relation_category_id == 3) && (b_follow&.relation_category_id == 3)
      a_follow&.family = true
      b_follow&.family = true
      a_follow&.save
      b_follow&.save
      a_follow.edit_family_pet(3)
      b_follow.edit_family_pet(3)
    else
      a_follow&.family = false
      b_follow&.family = false
      a_follow&.save
      b_follow&.save
      a_follow&.edit_family_pet(1)
      b_follow&.edit_family_pet(1)
    end
  end
end
