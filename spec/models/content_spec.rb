require 'rails_helper'

RSpec.describe Content, type: :model do
  before do
    @pet = create(:pet)
  end

  it 'コンテンツ登録成功' do
    content = @pet.contents.new(
      have_on: Date.today
    )
    expect(content).to be_valid
  end

  it '日付設定がない場合は登録失敗' do
    content = @pet.contents.new(
      have_on: nil
    )
    expect(content).not_to be_valid
  end
end
