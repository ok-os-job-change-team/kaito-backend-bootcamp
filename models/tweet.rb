class Tweet
  attr_reader :id, :user_id, :title, :tweet_content, :errors
  require_relative 'user'

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

  def present?
    id != nil 
  end

  def title_valid?
    if title == nil || title.length == 0
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
    if tweet_content == nil || tweet_content.length == 0
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
      errors.each do puts _1 end
  end
end


# user = User.new(id: 1, email: 'kaito@exampe.co.jp', password: 'p@ssw0rd_1', created_at: '2023-08-11', updated_at: '2023-08-12')
# tweet = Tweet.build_by_user(user: user, id: 1, title: 'test_title', tweet_content: 'test_content')
# binding.irb
# tweet.valid?
# tweet.output_error_messages
