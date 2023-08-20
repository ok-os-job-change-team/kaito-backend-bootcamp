class Favorite
  attr_reader :id, :user_id, :tweet_id, :errors

  def initialize(id:, user_id:, tweet_id:, errors:)
    @id = id
    @user_id = user_id
    @tweet_id = tweet_id
    @errors = errors
  end

  def present?
    id != nil 
  end
end
