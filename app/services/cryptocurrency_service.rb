require 'net/http'

class CryptocurrencyService
  def initialize (currency="BRL")
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
end