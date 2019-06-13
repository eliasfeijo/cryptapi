Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/crypto_coins', to: 'crypto_coins#index'
      put '/crypto_coins', to: 'crypto_coins#update_all'
    end
  end
end
