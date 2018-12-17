Rails.application.routes.draw do
  resources :number_runnings

  resources :users
  resources :posts

  resources :numbers do
    member do
      post :get_new_number
    end
  end

  post 'numbers/get_new_number', :controller=>'numbers', :action => 'get_new_number', :as => 'get_new_number'
end
