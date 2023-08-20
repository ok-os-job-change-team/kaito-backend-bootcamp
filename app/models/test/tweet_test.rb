require 'minitest/autorun'
require_relative '../tweet.rb'

class TweetTest < Minitest::Test
  # テスト1 => titleとtweet_contentに不備がない場合
  def test_1
    user_1 = User.new(id: 1, email: 'user_1@exampe.co.jp', password: 'p@ssw0rd_1', created_at: '2023-08-11', updated_at: '2023-08-12')
    tweet_1 = Tweet.build_by_user(user: user_1, id: 1, title: 'test_title', tweet_content: 'test_content')
    assert tweet_1.valid?
  end

  # テスト2 => titleが未記入の場合
  def test_2
    user_2 = User.new(id: 2, email: 'user_2@exampe.co.jp', password: 'p@ssw0rd_2', created_at: '2023-08-11', updated_at: '2023-08-12')
    tweet_2 = Tweet.build_by_user(user: user_2, id: 2, title: '', tweet_content: 'test_content')
    refute tweet_2.valid?
  end

  # テスト3 => titleが16字の場合
  def test_3
    user_3 = User.new(id: 3, email: 'user_3@exampe.co.jp', password: 'p@ssw0rd_3', created_at: '2023-08-11', updated_at: '2023-08-12')
    tweet_3 = Tweet.build_by_user(user: user_3, id: 3, title: '||||/||||/||||/|', tweet_content: 'test_content')
    refute tweet_3.valid?
  end

  # テスト4 => tweetが未記入の場合
  def test_4
    user_4 = User.new(id: 4, email: 'user_4@exampe.co.jp', password: 'p@ssw0rd_4', created_at: '2023-08-11', updated_at: '2023-08-12')
    tweet_4 = Tweet.build_by_user(user: user_4, id: 4, title: 'test_title', tweet_content: '')
    refute tweet_4.valid?
  end

  # テスト5 => tweetが101字の場合
  def test_5
    user_5 = User.new(id: 5, email: 'user_5@exampe.co.jp', password: 'p@ssw0rd_5', created_at: '2023-08-11', updated_at: '2023-08-12')
    tweet_5 = Tweet.build_by_user(user: user_5, id: 5, title: 'test_title', tweet_content: '||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/||||/|')
    refute tweet_5.valid?
  end

  # テスト6 => titleとtweet_contentどちらも不備がある場合
  def test_6
    user_6 = User.new(id: 6, email: 'user_6@exampe.co.jp', password: 'p@ssw0rd_6', created_at: '2023-08-11', updated_at: '2023-08-12')
    tweet_6 = Tweet.build_by_user(user: user_6, id: 5, title: '', tweet_content: '')
    refute tweet_6.valid?
  end
end
