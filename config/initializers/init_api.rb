
if !ENV["COINMARKETCAP_API_KEY"] then 
  raise "COINMARKETCAP_API_KEY environment variable is required."
end

if !ENV["CRYPT_API_DEFAULT_CURRENCY"] then
  raise "CRYPT_API_DEFAULT_CURRENCY environment variable is required."
end

if ActiveRecord::Base.connection.table_exists? 'crypto_coins' then
  puts "Initializing API"
  CryptocurrencyService.new().update_crypto_coins
end