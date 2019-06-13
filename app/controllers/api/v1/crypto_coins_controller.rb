module Api
  module V1
    class CryptoCoinsController < ApplicationController
      def index
        list_crypto_coin = CryptoCoin.all
        render json: {
          status: 'SUCCESS', 
          message: 'CryptoCoin list loaded', 
          data: list_crypto_coin
        }, status: :ok
      end
      def update_all
        currency = params[:currency] ? params[:currency] : "BRL"
        CryptocurrencyService.new(currency).update_crypto_coins
        list_crypto_coin = CryptoCoin.all
        render json: {
          status: 'SUCCESS',
          message: 'CryptoCoin list updated',
          data: list_crypto_coin
        }, status: :ok
      end
    end
  end
end