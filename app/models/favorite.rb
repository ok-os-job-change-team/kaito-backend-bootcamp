require_relative './model/support.rb'

class Favorite
  include Model::Support
  attr_reader :id, :user_id, :tweet_id, :errors

  def initialize(id:, user_id:, tweet_id:)
    @id = id
    @user_id = user_id
    @tweet_id = tweet_id
    @errors = Array.new
  end
end
