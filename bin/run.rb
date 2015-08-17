require_relative "environment.rb"

db = SQLite3::Database.new('db/pokemon.db')
ins = db.prepare('insert into catalog (name, type) values (?)')
string.each {|s| ins.execute(s)}
sql_runner = SQLRunner.new(db)
