require 'rails_helper'

RSpec.describe Pet, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ペット登録成功' do
    pet = Pet.new(
      name: 'ポチ',
      user_id: @user.id
    )
    expect(pet).to be_valid
  end

  it 'ペットネームが無いと登録失敗' do
    pet = Pet.new(
      name: '',
      user_id: @user.id
    )
    expect(pet).not_to be_valid
  end

  it 'ペットネームが20文字を超えると登録失敗' do
    pet = Pet.new(
      name: 'abcdefghijklmnopqrstuvwxyz',
      user_id: @user.id
    )
    expect(pet).not_to be_valid
  end

  it 'オーナーが居ないと登録失敗' do
    pet = Pet.new(
      name: 'ポチ'
    )
    expect(pet).not_to be_valid
  end

  it '誕生日が今日以前の場合は登録失成功' do
    Pet.create(name: 'ポチ', user_id: @user.id, birthday: Date.today)
    Pet.create(name: 'ポチ', user_id: @user.id, birthday: Date.today - 1)
    expect(Pet.all.count).to eq 2
  end

  it '誕生日が未来の場合は登録失敗' do
    pet = Pet.new(
      name: 'ポチ',
      user_id: @user.id,
      birthday: Date.today + 1
    )
    expect(pet).not_to be_valid
  end

  it '誕生日 =< お迎え日 の場合は登録成功' do
    Pet.create(name: 'ポチ', user_id: @user.id, birthday: Date.today, join_day: Date.today)
    Pet.create(name: 'ポチ', user_id: @user.id, birthday: Date.today, join_day: Date.today + 1)
    expect(Pet.all.count).to eq 2
  end

  it '誕生日 > お迎え日 の場合は登録失敗' do
    pet = Pet.new(
      name: 'ポチ',
      user_id: @user.id,
      birthday: Date.today,
      join_day: (Date.today - 1)
    )
    expect(pet).not_to be_valid
  end
end
