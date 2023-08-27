require_relative './model/support.rb'
require 'mysql2'

class User
  include Model::Support
  attr_reader :id, :email, :password, :created_at, :updated_at

  def initialize(id:, email:, password:, created_at: Time.now, updated_at: Time.now)
    @id = id
    @email = email
    @password = password
    @created_at = created_at
    @updated_at = updated_at
  end

  def self.all
    client = Mysql2::Client.new(
      host: 'database',
      username: 'root',
      password: 'root',
      database: 'demo'
    )
    results = client.query("SELECT * FROM Users", :cast => false)
    users = results.map { _1 }

    users.map do |user_hash|
      User.new(
        id: user_hash['id'],
        password: user_hash['pass'],
        email: user_hash['email'],
        created_at: user_hash['created_at'],
        updated_at: user_hash['updated_at']
      )
    end
  end
end
