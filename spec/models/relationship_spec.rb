require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    @user_1 = create(:user)
    @user_2 = create(:user)
    @category_1 = create(:relation_category_1)
  end

  it 'リレーションシップ登録成功' do
    relationship = @user_1.active_relationships.create(
      followed_id: @user_2.id,
      relation_category_id: @category_1.id
    )
    expect(relationship).to be_valid
  end

  it 'フォロー先が無い場合はリレーションシップ登録失敗' do
    relationship = @user_1.active_relationships.create(
      followed_id: nil,
      relation_category_id: @category_1.id
    )
    expect(relationship).not_to be_valid
  end

  it 'フォロー元が無い場合はリレーションシップ登録失敗' do
    relationship = Relationship.create(
      follower_id: nil,
      followed_id: @user_2.id,
      relation_category_id: @category_1.id
    )
    expect(relationship).not_to be_valid
  end

  it 'リレーションカテゴリーが無い場合はリレーションシップ登録失敗' do
    relationship = @user_1.active_relationships.create(
      followed_id: @user_2.id,
      relation_category_id: nil
    )
    expect(relationship).not_to be_valid
  end
end
