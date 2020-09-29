require 'rails_helper'

RSpec.describe Bond, type: :model do
  before do
    @pet = create(:pet)
    @other_user = create(:user)
    @category_1 = create(:relation_category_1)
    @category_4 = create(:relation_category_4)
  end

  it 'Bond 登録成功' do
    @pet.bonds.create(user_id: @pet.owner.id, relation_category_id: @category_4.id)
    @pet.bonds.create(user_id: @other_user.id, relation_category_id: @category_1.id)
    expect(Bond.all.count).to eq 2
  end

  it 'user_id が無いと Bond 登録失敗' do
    bond = @pet.bonds.new(user_id: nil, relation_category_id: @category_1.id)
    expect(bond).not_to be_valid
  end

  it 'relation_category_id が無いと Bond 登録失敗' do
    bond = @pet.bonds.new(user_id: @pet.owner.id, relation_category_id: nil)
    expect(bond).not_to be_valid
  end

end
