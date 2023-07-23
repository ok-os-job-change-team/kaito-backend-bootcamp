profile_hash = { profile: { gender: '男性', hometown: '愛媛' } }
user_attributes_hash = { id: 1111, profile_id: 121, created_at: '2023-07-10', updated_at: '2023-07-11' }
tweet_keys = [:id, :title, :content]
tweet_values = [
  [1, '激バズり', '今日は学校でタピオカ飲んでやった。先生はそれをみて羨ましそうだった。'],
  [2, '悲しいツイート', '今日は学校でうんち漏らした。悲しかった。']
]
# tweets_hashをtweet_keysとtweet_valuesを用いて作成する。
# 以下のような形にする。
tweets_hash = tweet_keys.zip(tweet_values[0])

tweets_hash = tweets_hash.flatten(1)
p Hash[*tweets_hash]
