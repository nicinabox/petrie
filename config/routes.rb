Petrie::Engine.routes.draw do
  root to: 'pages#home'

  get 'home', to: redirect('/')
  get '*page', to: 'pages#show', format: false, as: :page

end
