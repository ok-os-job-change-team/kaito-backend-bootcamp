# connect_db.rb

require 'mysql2'

client = Mysql2::Client.new(
  host: 'db',                  # Docker Composeのサービス名をホストとして使用
  username: 'root',
  password: 'root',
  database: 'demo'
)

binding.irb

results = client.query("SELECT * FROM products", :cast => false)
products = results.map { _1 }

client.close
