Rails.application.routes.draw do

root to: 'sales#index'  
resources :sales, only: :index

end
