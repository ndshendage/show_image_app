Rails.application.routes.draw do
  resources :acvs
  resources :authors
  resources :books
  resources :photos do
    collection do
      get :my_photos
      get :user_photos
    end
  end
  resources :albums do
    collection do
      get 'my_albums', to: "albums#user_profile"
      get :all_albums
    end
  end
  devise_for :users
  root 'pages#home_page'
end
