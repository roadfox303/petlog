require 'rails_helper'

RSpec.describe RecordCategory, type: :model do
  before do
    @pet = create(:pet)
    @icon = create(:icon)
  end

  it 'レコードカテゴリー登録成功' do
    record_category = RecordCategory.new(
      title: 'テストカテゴリ',
      pet_id: @pet.id,
      icon_id: @icon.id
    )
    expect(record_category).to be_valid
  end

  it 'タイトルが無いと登録失敗' do
    record_category = RecordCategory.new(
      title: nil,
      pet_id: @pet.id,
      icon_id: @icon.id
    )
    expect(record_category).not_to be_valid
  end

  it 'タイトルが30文字以上の場合は登録失敗' do
    record_category = RecordCategory.new(
      title: [*:a..:z,*0..9].sample(31).join,
      pet_id: @pet.id,
      icon_id: @icon.id
    )
    expect(record_category).not_to be_valid
  end

  it 'ペットIDが無い場合は登録失敗' do
    record_category = RecordCategory.new(
      title: 'テストカテゴリ',
      pet_id: nil,
      icon_id: @icon.id
    )
    expect(record_category).not_to be_valid
  end

  it 'アイコンIDが無い場合は登録失敗' do
    record_category = RecordCategory.new(
      title: 'テストカテゴリ',
      pet_id: @pet.id,
      icon_id: nil
    )
    expect(record_category).not_to be_valid
  end

end
