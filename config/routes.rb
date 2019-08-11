Rails.application.routes.draw do
  resources :orders
  namespace :api do
    namespace :v1 do
      resources :workers
      patch '/workers/:id/assign', to:'workers#assign_to_order'
      resources :orders
      get '/orders/:id/workers', to:'orders#show_order_workers'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
