
if !ENV["COINMARKETCAP_API_KEY"] then 
  raise "COINMARKETCAP_API_KEY environment variable is required."
end

puts "Initializing API"

currency = "BRL"
response_json = CryptocurrencyService.new(currency).get_cryptocurrency_list
data = JSON.parse(response_json)["data"]

if data.nil? then
  raise "Bad response:\n #{response_json}"
end

if CryptoCoin.first then
  puts "Updating current database"
  data.each do |coin|
    title = coin["name"]
    price = coin["quote"][currency]["price"]
    crypto_coin = CryptoCoin.find_by(title: title)
    crypto_coin.update(price: price)
  end
else
  puts "Populating CryptoCoin table"
  data.each do |coin|
    title = coin["name"]
    price = coin["quote"][currency]["price"]
    crypto_coin = CryptoCoin.create(title: title, price: price)
  end
end