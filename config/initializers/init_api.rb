require 'net/http'

if !ENV["COINMARKETCAP_API_KEY"] then 
  raise "COINMARKETCAP_API_KEY environment variable is required."
end

puts "Initializing API"