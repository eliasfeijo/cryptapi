Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      get '/crypto_coins', to: 'crypto_coins#index'
    end
  end
end
