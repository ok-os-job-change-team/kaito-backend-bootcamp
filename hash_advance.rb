profile_hash = { profile: { gender: '男性', hometown: '愛媛' } }
user_attributes_hash = { id: 1111, profile_id: 121, created_at: '2023-07-10', updated_at: '2023-07-11' }
tweet_keys = [:id, :title, :content]
tweet_values = [
  [1, '激バズり', '今日は学校でタピオカ飲んでやった。先生はそれをみて羨ましそうだった。'],
  [2, '悲しいツイート', '今日は学校でうんち漏らした。悲しかった。']
]

# tweet_keysとtweet_valuesからHashを作り、配列(tweets)に格納
tweets = tweet_values.map { |element| Hash[tweet_keys.zip(element)] }

# tweets_hashに各配列を結合
tweets_hash = profile_hash.merge({tweets: tweets}, user_attributes_hash)

p tweets
p tweets_hash
