require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @content = create(:content)
    @record_category = create(:record_category, pet_id: @content.pet.id )
    @user = @content.pet.owner
  end

  it 'レコード登録成功' do
    record = @content.records.new(
      record_category_id: @record_category.id,
      user_id: @user.id
    )
    expect(record).to be_valid
  end

  it 'コンテンツIDが無い場合は登録失敗' do
    record = Record.new(
      record_category_id: @record_category.id,
      user_id: @user.id
    )
    expect(record).not_to be_valid
  end

  it 'ユーザーIDが無い場合は登録失敗' do
    record = @content.records.new(
      record_category_id: @record_category.id,
      user_id: nil
    )
    expect(record).not_to be_valid
  end

  it 'レコードカテゴリーIDが無い場合は登録失敗' do
    record = @content.records.new(
      record_category_id: nil,
      user_id: @user.id
    )
    expect(record).not_to be_valid
  end
end
