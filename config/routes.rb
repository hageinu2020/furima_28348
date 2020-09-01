Rails.application.routes.draw do

  devise_for :users
root to: 'sales#index' 
resources :sales do
  resources :buys, only: [:index, :create]
  end

end
