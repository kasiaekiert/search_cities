# City names: Paris, Budapest, Skopje, Rotterdam, Valencia, Vancouver, Amsterdam, Vienna, Sydney, New York City, London, Bangkok, Hong Kong, Dubai, Rome Istanbul]

class City
  NAMES = ["Paris", "Budapest", "Skopje", "Rotterdam", 
           "Valencia", "Vancouver", "Amsterdam", "Vienna", 
           "Sydney", "New York City", "London", "Bangkok", 
           "Hong Kong", "Dubai", "Rome", "Istanbul"].freeze

  def self.search(phrase)
    return if phrase.nil?
    return NAMES if phrase == "*"
    return if phrase.length < 2

    cities = NAMES.select { |city| city.downcase.include?(phrase.downcase) }

    return cities unless cities.empty?
  end
end