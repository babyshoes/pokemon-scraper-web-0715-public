require 'pokemon'
class Scraper
  attr_accessor :db

  def initialize(db)
    @db = db
  end

  def insert(name, type)
    sql = "INSERT INTO pokemon(name, type) VALUES(?, ?)"
    @db.execute(sql, name, type)
  end

  def scrape
    f = File.open("pokemon_index.html")
    doc = Nokogiri::HTML(f)
    f.close

    doc.css('.infocard-tall').each do |pokemon_container|
      name = pokemon_container.css('.ent-name').text
      type = pokemon_container.css('.aside').text

      Pokemon.save(name, type, @db)
    end
  end

end



# db = SQLITE3
#
# require 'nokogiri'
# require 'open-uri'
#
# class Scraper
#
#   attr_accessor :id, :name, :type
#
#   def initialize()
#     pokemon = Nokogiri::HTML(open("./pokemon_index.html"))
#
#     pokemon_hash = {}
#
#     pokemon.css("span.infocard-tall").each do |creature|
#       pokemon_hash = {
#         id: get_id(creature),
#         name: get_name(creature),
#         type: get_type(creature)
#       }
#     end
#   end
#
#   private
#
#   def get_id(monster)
#     monster.css("small:first-of-type").text
#   end
#
#   def get_name(monster)
#     monster.css(".ent-name").text
#   end
#
#   def get_type(monster)
#     # type: creature.css(".aside").text.split(" · ")
#     types = monster.css(".aside .itype")
#     types = types.collect {|type| type.text}
#   end
#
# end
