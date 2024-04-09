require "http"
require "json"
puts "Will you need an umbrella today?"
puts "Where are you?"
locationresponse = gets.chomp
locationkey = ENV.fetch("GMAPS_KEY")
googleapirequest = "https://maps.googleapis.com/maps/api/geocode/json?address=#{locationresponse}&key=#{locationkey}"
googlecoordinates = HTTP.get(googleapirequest)
parsed_googlecoordinates = JSON.parse(googlecoordinates)
results_array = parsed_googlecoordinates.fetch("results")
address_components_hash = results_array.at(0) 
geometry_hash = address_components_hash.fetch("geometry")
location_hash = geometry_hash.fetch("location")
latitude = location_hash.fetch("lat")
longitude = location_hash.fetch("lng")
weatherkey = ENV.fetch("PIRATE_WEATHER_KEY")
pirateapirequest = "https://api.pirateweather.net/forecast/#{weatherkey}/#{latitude},#{longitude}"
weatherresults = HTTP.get(pirateapirequest)
parsed_weatherresults = JSON.parse(weatherresults)
currently_hash = parsed_weatherresults.fetch("currently")
temperature = currently_hash.fetch("temperature")
puts "It is currently #{temperature} F."
minute_hash = parsed_weatherresults.fetch("minutely")
current_status = minute_hash.fetch("summary")
puts "Next hour: #{current_status}"
