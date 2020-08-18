Rails.application.routes.draw do

  devise_for :users
root to: 'sales#index' 

resource :sales, only: [:index, :new, :create]

end
