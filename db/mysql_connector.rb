require 'mysql2'

def create_db_client
  Mysql2::Client.new(
    host: ENV['host'],
    username: ENV['username'],
    password: ENV['password'],
    database: ENV['database']
  )
end
