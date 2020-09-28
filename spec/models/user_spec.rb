require 'rails_helper'

RSpec.describe User, type: :model do
  it 'ユーザー登録成功' do
    user = User.new(
      name: 'テスト太郎',
      email: 'testaro@example.com',
      password: 'password'
    )
    expect(user).to be_valid
  end

  it 'ユーザーネームが無いと登録失敗' do
    user = User.new(
      name: '',
      email: 'testaro@example.com',
      password: 'password'
    )
    expect(user).not_to be_valid
  end

  it 'ユーザーネームが20文字を超えると登録失敗' do
    user = User.new(
      name: 'abcdefghijklmnopqrstuvwxyz',
      email: 'testaro@example.com',
      password: 'password'
    )
    expect(user).not_to be_valid
  end

  it 'メールアドレスが無いと登録失敗' do
    user = User.new(
      name: 'テスト太郎',
      email: '',
      password: 'password'
    )
    expect(user).not_to be_valid
  end

  it 'メールアドレスがフォーマットに反している文字列の場合は登録失敗' do
    User.create(name: 'テスト太郎', email: 'testaroexample.com', password: 'password')
    User.create(name: 'テスト太郎', email: 'testaroe@xamplecom', password: 'password')
    User.create(name: 'テスト太郎', email: 'testaro@example.123', password: 'password')
    User.create(name: 'テスト太郎', email: 'testaro@.com', password: 'password')
    expect(User.all.count).to eq 0
  end

  it 'パスワードがないと登録失敗' do
    user = User.new(
      name: 'テスト太郎',
      email: 'testaro@example.com',
      password: ''
    )
    expect(user).not_to be_valid
  end

  it 'パスワードが8文字未満だと登録失敗' do
    user = User.new(
      name: 'テスト太郎',
      email: 'testaro@example.com',
      password: 'abcde',
    )
    expect(user).not_to be_valid
  end
end
