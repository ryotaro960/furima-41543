Rails.application.routes.draw do
  devise_for :users
  root to: 'furimas#index'

  resources :furimas do
    resources :trade_record_sending_address only: [:index, :create]
  end

end