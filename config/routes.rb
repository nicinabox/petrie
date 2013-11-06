Rails.application.routes.draw do
  root to: 'pages#home'

  get 'home', to: redirect('/')
  get '*page', to: 'pages#show',
               format: false,
               as: :page

  if defined? ActiveAdmin
    namespace :admin do
      resources :pages do
        collection do
          post :rebuild
        end
      end
    end
  end

end
