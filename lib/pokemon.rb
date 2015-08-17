require 'scraper'
class Pokemon

  attr_accessor :id, :name, :type, :hp

  def initialize(id, name, type, hp, db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon(name, type) VALUES(?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon where id = ?"
    row = db.execute(sql, id)

    p = Pokemon.new(*row.first, db)
  end

  def alter_hp(new_hp)
    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
    @db.execute(sql, new_hp, self.id)
  end

end
