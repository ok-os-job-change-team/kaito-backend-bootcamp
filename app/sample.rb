require 'mysql2'
require_relative './models/user.rb'

client = Mysql2::Client.new(
  host: 'database',                  # Docker Composeのサービス名をホストとして使用
  username: 'root',
  password: 'root',
  database: 'demo'
)
results = client.query("SELECT * FROM Users", :cast => false)
users = results.map { _1 }

binding.irb
