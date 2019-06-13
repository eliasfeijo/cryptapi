require 'net/http'

class CryptocurrencyService
  def initialize (currency=ENV["CRYPTO_API_DEFAULT_CURRENCY"])
    @currency = currency
    puts "CryptocurrencyService started with currency: #{@currency}"
  end
  def get_cryptocurrency_list
    uri = URI.parse("https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest")
    args = {start: 1, limit: 10, convert: @currency}
    uri.query = URI.encode_www_form(args)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    req["Accept"] = "application/json"
    req["X-CMC_PRO_API_KEY"] = ENV["COINMARKETCAP_API_KEY"]
    res = http.request(req)
    res.body
  end
  def update_crypto_coins
    response_json = get_cryptocurrency_list
    data = JSON.parse(response_json)["data"]

    if data.nil? then
      raise "Bad response:\n #{response_json}"
    end

    if CryptoCoin.first then
      puts "Updating current database"
      data.each do |coin|
        title = coin["name"]
        price = coin["quote"][@currency]["price"]
        crypto_coin = CryptoCoin.find_by(title: title)
        crypto_coin.update(price: price)
      end
    else
      puts "Populating CryptoCoin table"
      data.each do |coin|
        title = coin["name"]
        price = coin["quote"][@currency]["price"]
        crypto_coin = CryptoCoin.create(title: title, price: price)
      end
    end
  end
end