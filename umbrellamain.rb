require "http"
require "json"
puts "Will you need an umbrella today?"
puts "Where are you?"
locationresponse = gets.chomp
locationkey = ENV.fetch("GMAPS_KEY")
googleapirequest = "https://maps.googleapis.com/maps/api/geocode/json?address=#{locationresponse}&key=#{locationkey}"
pp googleapirequest
googlecoordinates = HTTP.get(googleapirequest)
parsed_googlecoordinates = JSON.parse(googlecoordinates)
pp parsed_googlecoordinates
results_array = parsed_googlecoordinates.fetch("results")
address_components_hash = results_array.at(0) 
geometry_hash = address_components_hash.fetch("geometry")
location_hash = geometry_hash.fetch("location")
pp location_hash
