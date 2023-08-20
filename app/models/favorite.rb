class Favorite
  attr_reader :id, :user_id, :tweet_id

  def initialize(id:, user_id:, tweet_id:)
    @id = id
    @user_id = user_id
    @tweet_id = tweet_id
  end
end
