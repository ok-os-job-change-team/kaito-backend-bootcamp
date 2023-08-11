require 'minitest/autorun'
require_relative '../user.rb'

class UserTest < Minitest::Test

  # ユーザー1 => インスタンス変数がすべて揃っている場合
  def test_user_1
    user_1 = User.new(1, 'kaito@exampe.co.jp', 'p@ssw0rd_1', '2023-08-11', '2023-08-12')
    assert user_1.present?
  end

  # ユーザー2 => インスタンス変数が不足している場合
  def test_user_2
    user_2 = User.new(nil, 'shoichi@exampe.co.jp', 'p@ssw0rd_2', '2023-08-11', '2023-08-12')
    refute user_2.present?
  end
end
