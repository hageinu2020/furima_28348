Rails.application.routes.draw do
  
resources :sales, only: :index

end
