require 'mysql2'

module Database
  class Client 
    def self.connect_db
      # Ref: https://github.com/brianmario/mysql2#usage
      Mysql2::Client.new(
        # Docker Composeのサービス名をホストとして指定する（docker composeを用いると、サービス名がホスト名になる。）
        host: 'db',                  
        username: 'root',
        password: 'root',
        database: 'demo'
      )
    end
  end
end
