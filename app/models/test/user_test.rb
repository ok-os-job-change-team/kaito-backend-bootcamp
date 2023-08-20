require 'minitest/autorun'
require_relative '../user.rb'

class UserTest < Minitest::Test

  # ユーザー1 => インスタンス変数がすべて揃っている場合
  def test_user_1
    user = User.new(id: 1, email: 'kaito@exampe.co.jp', password: 'p@ssw0rd_1', created_at: '2023-08-11', updated_at: '2023-08-12')
    assert user.present?
  end

  # ユーザー2 => インスタンス変数が不足している場合
  def test_user_2
    user = User.new(id: nil, email: 'shoichi@exampe.co.jp', password: 'p@ssw0rd_2', created_at: '2023-08-11', updated_at:'2023-08-12')
    refute user.present?
  end
end
