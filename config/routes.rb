Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  root to: 'home#index'
  
  resources :users, only: [:index] do
    member do
      patch :approve
    end
  end

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

end
