require "http"
require "json"
puts "Will you need an umbrella today?"
puts "Where are you?"
locationresponse = gets.chomp
locationkey = ENV.fetch("GMAPS_KEY")
apirequest = "https://maps.googleapis.com/maps/api/geocode/json?address=#{locationresponse}&key=#{locationkey}"
pp apirequest
