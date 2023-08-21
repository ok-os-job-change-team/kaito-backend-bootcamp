class Favorite
  attr_reader :id, :user_id, :tweet_id, :errors

  def initialize(id:, user_id:, tweet_id:)
    @id = id
    @user_id = user_id
    @tweet_id = tweet_id
    @errors = Array.new
  end

  def present?
    id != nil 
  end
end
