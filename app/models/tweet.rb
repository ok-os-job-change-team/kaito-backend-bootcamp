require_relative 'user'
require_relative './model/support.rb'

class Tweet
  include Model::Support
  attr_reader :id, :user_id, :title, :tweet_content, :errors

  def initialize(id:, user_id:, title:, tweet_content:)
    @id = id
    @user_id = user_id
    @title = title
    @tweet_content = tweet_content
    @errors = Array.new
  end

  def self.build_by_user(user:, id:, title:, tweet_content:)
    user_id = user.id
    Tweet.new(user_id: user_id, id: id, title: title, tweet_content: tweet_content)
  end

  def title_valid?
    if title == nil || title.empty?
      errors << 'titleを入力して下さい。'
      return false
    elsif title.length > 15
      errors << 'titleは15文字以内にして下さい。'
      return false
    else
      return true
    end
  end

  def tweet_content_valid?
    if tweet_content == nil || tweet_content.empty?
      errors << 'tweet_contentを入力して下さい。'
      return false
    elsif tweet_content.length > 100
      errors << 'tweet_contentは100文字以内にして下さい。'
      return false
    else
      return true
    end
  end

  def valid?
    result_title_valid = title_valid?
    result_tweet_content_valid = tweet_content_valid?
    result_title_valid && result_tweet_content_valid
  end

  def output_error_messages
    errors.each { puts _1 }
  end
end
