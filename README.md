# CryptAPI

Read the requirements below before running the application.

Made with:

- [Ruby](https://www.ruby-lang.org/) version 2.5.1
- [Rails](https://rubyonrails.org/) version 5.2.3

## Requirements

After cloning the repo, `cd` into the directory. Create a file named `.env` and insert the following variables:
```
COINMARKETCAP_API_KEY=<your API key here>
CRYPTO_API_DEFAULT_CURRENCY=BRL
```

`COINMARKETCAP_API_KEY` is the [CoinMarketCap](https://sandbox.coinmarketcap.com/) API Key.
`CRYPTO_API_DEFAULT_CURRENCY` should be `BRL` or `USD`.

## Compile and run

Run `rails db:migrate` and then `rails server -b 0.0.0.0`.

## Routes

There are two routes defined:

- GET /api/v1/crypto_coins
- PUT /api/v1/crypto_coins

The `GET` request returns a JSON with the list of CryptoCoins.
The `PUT` request updates the list of CryptoCoins, and takes an optional `currency` parameter.